import asyncio
import traceback
from videosdk.agents import Agent, AgentSession, Pipeline, JobContext, RoomOptions, WorkerJob, Options, InterruptConfig, EOUConfig
from videosdk.plugins.google import GeminiRealtime, GeminiLiveConfig
from dotenv import load_dotenv
import os
import logging
import json
import asyncpg
import google.generativeai as genai

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

load_dotenv()

# Define the agent's behavior and personality
class MyVoiceAgent(Agent):
    def __init__(self):
        super().__init__(
            instructions=(
                "You are a professional and empathetic AI assistant for the Government Services Department. "
                "Your goal is to help citizens report issues to departments like Water, Fire, Electricity, etc. "
                "\n\n"
                "LANGUAGE RULE: Detect the language used by the user (English, Hindi, or Gujarati) and ALWAYS respond in that same language. "
                "\n\n"
                "CONVERSATIONAL FLOW: "
                "1. GREETING & LOCATION: Start by greeting the user warmly and asking for their current zone or specific location. "
                "2. DEPARTMENT IDENTIFICATION: Ask which department their issue is related to (e.g., Water, Fire, Road, Waste Management). "
                "3. DYNAMIC PROBING: Based on the department, intelligently ask follow-up questions to gather necessary details: "
                "   - For WATER: Ask for the exact address, type of issue (leakage, no supply, contamination), duration of the problem, and any additional details. "
                "   - For FIRE: Immediately ask for the exact location, nature of the fire, and if there are people at risk. "
                "   - For OTHERS: Use your judgment to ask for location, severity, and nature of the complaint. "
                "\n\n"
                "OUT OF SCOPE RULE: If a user asks questions unrelated to government services or department reporting (e.g., personal questions, general knowledge, or other topics), "
                "politely inform them that you are a dedicated assistant for government services and can only assist with department-related reports. "
                "Always steer the conversation back to the reporting flow. "
                "\n\n"
                "OBJECTIVE: Do not follow a rigid script. Be conversational. Gather all required information naturally. "
                "Once you have all details, summarize the report back to the user and inform them that it has been registered with the respective department."
            ),
        )

    async def on_enter(self) -> None:
        print("🎙️ Agent has officially entered the conversation!")
        print("🚀 Agent Session Started - Dynamic Government Agent")
        # Give the audio a moment to stabilize then trigger the first greeting
        await asyncio.sleep(1)
        # The agent will now proactively start the conversation based on instructions
        await self.session.say("Hello! This is the Government Services Department. How can I help you today?")

    async def on_exit(self) -> None:
        logger.info("\n" + "="*30)
        logger.info("CONVERSATION LOG (FINAL)")
        logger.info("="*30)
        full_log = []
        for msg in self.chat_context.messages():
            role = msg.role.value.upper()
            # Content can be a string or a list of items; join them for logging
            content = msg.content if isinstance(msg.content, str) else " ".join([str(c) for c in msg.content])
            if role != "SYSTEM": # We usually don't need to log the system instructions
                full_log.append(f"{role}: {content}")
                logger.info(f"{role}: {content}")
        logger.info("="*30 + "\n")

        # Save to PostgreSQL
        try:
            logger.info("💾 Saving complaint to PostgreSQL...")
            
            log_text = "\n".join(full_log)
            if not log_text.strip():
                logger.info("⚠️ Log is empty, skipping DB save.")
                return

            # Use Gemini to extract structured info
            genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
            # Use a stable model for extraction
            extraction_model = genai.GenerativeModel('gemini-1.5-flash')
            
            prompt = f"""
            Extract the following details from this conversation log and return ONLY a valid JSON object without markdown formatting.
            {{
                "summary": "Short title of the issue",
                "department": "The department ID (MUST BE one of: d1 for Water Resources, d2 for Roads & Transport, d3 for Electricity, d1-1 for Billing & Meters)",
                "priority": "LOW, MEDIUM, HIGH, or CRITICAL",
                "complainant_name": "Name of the caller if provided, else 'Unknown'",
                "location": "Location if provided, else 'Unknown'"
            }}
            
            Conversation Log:
            {log_text}
            """
            
            try:
                logger.info("🧠 Extracting information with Gemini...")
                # Use async version to avoid blocking
                response = await extraction_model.generate_content_async(prompt)
                text = response.text.strip()
                
                # Robust JSON extraction
                json_text = text
                if "```json" in text:
                    json_text = text.split("```json")[1].split("```")[0].strip()
                elif "```" in text:
                    json_text = text.split("```")[1].split("```")[0].strip()
                
                extracted_data = json.loads(json_text)
                summary = extracted_data.get('summary', 'Voice Complaint Log')
                department = extracted_data.get('department', 'General')
                priority = extracted_data.get('priority', 'MEDIUM')
                complainant_name = extracted_data.get('complainant_name', 'Unknown')
                location = extracted_data.get('location', 'Unknown')
                logger.info(f"📋 Extracted: {summary} ({department})")
            except Exception as e:
                logger.warning(f"⚠️ Failed to parse AI extraction: {e}")
                # Fallback
                agent_msgs = [msg for msg in full_log if msg.startswith("AGENT:")]
                summary = agent_msgs[-1].replace("AGENT: ", "") if agent_msgs else "Voice Complaint Log"
                department = "General"
                priority = "MEDIUM"
                complainant_name = "Unknown"
                location = "Unknown"

            logger.info(f"🔌 Connecting to database...")
            # Use environment variables for connection
            conn = await asyncpg.connect(
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                database=os.getenv("DB_NAME"),
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT"),
                timeout=10
            )
            
            try:
                logger.info(f"📝 Executing INSERT...")
                await conn.execute(
                    "INSERT INTO complaints (summary, full_log, department, priority, complainant_name, location) VALUES ($1, $2, $3, $4, $5, $6)", 
                    summary, log_text, department, priority, complainant_name, location
                )
                logger.info("✅ Complaint saved to PostgreSQL successfully.")
            finally:
                await conn.close()
                logger.info("🔌 Database connection closed.")
                
        except Exception as e:
            logger.error(f"❌ Failed to save complaint to PostgreSQL: {e}")
            traceback.print_exc()

async def start_session(context: JobContext):
    # Configure the Gemini model for real-time voice
    model = GeminiRealtime(
        model="gemini-2.5-flash-native-audio-preview-12-2025", # Reverted to your specific working model
        api_key=os.getenv("GOOGLE_API_KEY"),
        config=GeminiLiveConfig(
            voice="Leda",
            response_modalities=["AUDIO"]
        )
    )
    pipeline = Pipeline(
        llm=model,
        eou_config=EOUConfig(min_max_speech_wait_timeout=[1.0, 1.5]), # More natural & stable
        interrupt_config=InterruptConfig(
            mode="HYBRID",
            interrupt_min_words=2,
            interrupt_min_duration=0.5
        )
    )
    @pipeline.on("transcript_ready")
    def on_transcript(data):
        print(f"👤 USER: {data['text']}")

    @pipeline.on("agent_speech_ready")
    def on_agent_speech(data):
        # Log agent speech as it happens
        if "text" in data and data["text"]:
            print(f"🤖 AGENT: {data['text']}")

    session = AgentSession(agent=MyVoiceAgent(), pipeline=pipeline)
    print("🎯 Agent Session Initialized")

    try:
        await session.start(run_until_shutdown=True)
        print("✅ Session Ended Gracefully")
    except Exception as e:
        print(f"❌ Session Error: {e}")

def make_context() -> JobContext:
    # Enable auto_end_session so on_exit is triggered immediately when user hangs up
    room_options = RoomOptions(
        auto_end_session=True, 
    )
    return JobContext(room_options=room_options)

if __name__ == "__main__":
    try:
        # Register the agent with a unique ID
        options = Options(
            agent_id="agent_123", # CRITICAL: Unique identifier for routing
            register=True, # REQUIRED: Register with VideoSDK for telephony
            max_processes=10, # Concurrent calls to handle
            host="0.0.0.0",
            port=3010,
        )
        job = WorkerJob(entrypoint=start_session, jobctx=make_context, options=options)
        job.start()
    except Exception as e:
        traceback.print_exc()