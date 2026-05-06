--
-- PostgreSQL database dump
--

\restrict IJavyy0HhcZZQyBiWDwHbqduuF4EMXmjz8dTwxEZrqJUawX3DA74IRj8pfE9Ulm

-- Dumped from database version 15.16 (Homebrew)
-- Dumped by pg_dump version 15.16 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: aditya
--

INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (1, 'Updated complaint #2 (Assigned to u3)', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '2', '2026-05-02 13:56:54.918489');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (2, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '3', '2026-05-02 14:00:11.96476');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (3, 'Updated complaint #2 (Assigned to u3)', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '2', '2026-05-02 14:00:22.752391');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (4, 'Updated complaint #2 (Assigned to u3)', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '2', '2026-05-02 14:00:37.029621');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (5, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '2', '2026-05-02 14:00:51.51378');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (6, 'Updated complaint #1 (Assigned to u3)', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '1', '2026-05-02 14:01:22.26956');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (7, 'Updated complaint #1 (Assigned to u3)', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '1', '2026-05-02 14:01:49.758279');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (8, 'Deleted department', 'u1', 'SUPER_ADMIN', 'DEPARTMENT', 'd-1777709099269', '2026-05-02 14:03:34.380632');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (9, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '4', '2026-05-02 14:06:07.169031');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (10, 'Invited new user', 'u1', 'SUPER_ADMIN', 'USER', 'u-1777711367921', '2026-05-02 14:12:47.925698');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (11, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '6', '2026-05-02 14:16:37.772006');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (12, 'Deleted department', 'u1', 'SUPER_ADMIN', 'DEPARTMENT', 'd-1777709342323', '2026-05-02 14:20:14.694369');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (13, 'Deleted department', 'u1', 'SUPER_ADMIN', 'DEPARTMENT', 'd1-1', '2026-05-02 14:20:23.491615');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (14, 'Complaint registered via Voice Bot', 'SYSTEM', 'SYSTEM', 'COMPLAINT', '8', '2026-05-02 14:22:01.761176');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (15, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '8', '2026-05-02 14:22:31.087727');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (16, 'Complaint registered via Voice Bot', 'SYSTEM', 'SYSTEM', 'COMPLAINT', '9', '2026-05-03 10:10:55.970432');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (17, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '9', '2026-05-03 10:11:11.714146');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (18, 'Complaint registered via Voice Bot', 'SYSTEM', 'SYSTEM', 'COMPLAINT', '10', '2026-05-03 10:11:36.125534');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (19, 'Complaint registered via Voice Bot', 'SYSTEM', 'SYSTEM', 'COMPLAINT', '11', '2026-05-03 10:13:39.239378');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (20, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '10', '2026-05-03 10:17:33.984148');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (21, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '11', '2026-05-03 10:17:39.858665');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (22, 'Complaint registered via Voice Bot', 'SYSTEM', 'SYSTEM', 'COMPLAINT', '12', '2026-05-03 10:33:51.73364');
INSERT INTO public.audit_logs (id, action, performed_by_id, performed_by_role, target_type, target_id, "timestamp") VALUES (23, 'Deleted complaint', 'u1', 'SUPER_ADMIN', 'COMPLAINT', '12', '2026-05-03 10:34:03.253519');


--
-- Data for Name: complaints; Type: TABLE DATA; Schema: public; Owner: aditya
--

INSERT INTO public.complaints (id, summary, full_log, created_at, department, status, priority, complainant_name, location, assigned_officer_id, complainant_email) VALUES (1, 'Road with potholes', 'ASSISTANT: Hello! This is the Government Services Department. How can I help you today?
USER:  Hello.
ASSISTANT: Hello! This is the Government Services Department. How can I help you today?
USER:  मेरे घर के पास जो रोड है ना वो खराब हो गई है
ASSISTANT: नमस्ते। कृपया अपना क्षेत्र या सटीक स्थान बताएँ, ताकि मैं आपकी शिकायत दर्ज कर सकूँ।
USER:  મેં વરાછા જોન મે રહેતા હું
USER:  और मैं यदि के विस्तार में रहता हूं
ASSISTANT: धन्यवाद। यह शिकायत किस विभाग से संबंधित है - जल, अग्नि, सड़क या कचरा प्रबंधन?
USER:  सड़क
ASSISTANT: सड़क से संबंधित क्या समस्या है? क्या वहाँ गड्ढे हैं, या कोई अन्य समस्या है?
USER:  गुड डे
ASSISTANT: ठीक है। क्या आप मुझे सटीक स्थान और इस समस्या की अवधि बता सकते हैं? कोई अतिरिक्त जानकारी भी सहायक हो सकती है।
USER:  पिछले दो महीने से इशू आ रहा है
ASSISTANT: समझ गया। आपकी शिकायत सत्यनारायण सोसाइटी, वराछा ज़ोन के लिए दर्ज की जा रही है, जहाँ पिछले दो महीनों से सड़क खराब होने का मुद्दा है। क्या यह सभी विवरण सही हैं? आपकी शिकायत संबंधित विभाग को भेज दी जाएगी।
USER:  હા સાચી છે
ASSISTANT: आपकी शिकायत दर्ज कर दी गई है और संबंधित विभाग को सूचित कर दिया गया है। धन्यवाद।', '2026-05-02 13:00:17.419754', 'd2', 'RESOLVED', 'LOW', 'Unknown', 'Satyanarayan Society, Varachha Zone', 'u3', 'test@gmail.com');
INSERT INTO public.complaints (id, summary, full_log, created_at, department, status, priority, complainant_name, location, assigned_officer_id, complainant_email) VALUES (5, 'No water supply in Satyanarayan Society, Yogichowk', 'ASSISTANT: Hello! This is the Government Services Department. How can I help you today?
USER:  హలో
ASSISTANT: Hello! This is the Government Services Department. How can I help you today? Could you please tell me your current zone or specific location?
USER:  હું વરાછા વિસ્તારમાં રહું છું અને મારો ઝોન છે વરાછા
ASSISTANT: સમજી શકાય છે. તમારો ઝોન વરાછા છે. કૃપા કરીને જણાવો કે તમારો મુદ્દો કયા વિભાગ સાથે સંબંધિત છે? (જેમ કે, પાણી, ફાયર, રોડ, કચરા વ્યવસ્થાપન)
USER:  મારો પ્રશ્ન પાણી વિભાગ રિલેટેડ છે
ASSISTANT: ઠીક છે. પાણી વિભાગ સંબંધિત મુદ્દા માટે, શું તમે મને ચોક્કસ સરનામું, સમસ્યાનો પ્રકાર (જેમ કે લીકેજ, પાણીનો પુરવઠો નહીં, દૂષિત પાણી), સમસ્યાની અવધિ અને કોઈપણ વધારાની વિગતો આપી શકો છો?
USER:  સમસ્યા છે યોગીચોક વિસ્તારમાં આવી રહી છે અને પાણીનો પુરવઠો અહીંયા નથી પાણી આવતું જ નથી
ASSISTANT: સમસ્યા યોગીચોક વિસ્તારમાં છે અને પાણીનો પુરવઠો નથી. આ સમસ્યા કેટલા સમયથી ચાલી રહી છે? અને શું તમે ચોક્કસ સરનામું આપી શકો છો જેથી અમે તેને સરળતાથી શોધી શકીએ?
USER:  आज समस्या છેલ્લા બે દિવસથી આવે છે અને ચોક્કસ સરનામું એ છે કે યોગી ચોકમાં સત્યનારાયણની નામની એક સોસાયટી છે ત્યાં આ સમસ્યા આવે છે
ASSISTANT: સમજાય ગયું. યોગીચોક વિસ્તારમાં સત્યનારાયણ નામની સોસાયટીમાં છેલ્લા બે દિવસથી પાણીનો પુરવઠો નથી. હું તમારી ફરિયાદ નોંધાવી રહ્યો છું. શું આ ઉપરાંત કોઈ બીજી વિગત છે જે તમે આપવા માંગો છો?
USER:  ના બીજું કશું નથી
ASSISTANT: મેં તમારી ફરિયાદ નોંધી લીધી છે. યોગીચોક વિસ્તારમાં સત્યનારાયણ સોસાયટીમાં છેલ્લા બે દિવસથી પાણીનો પુરવઠો ન હોવા અંગેની ફરિયાદ નોંધવામાં આવી છે. તમારી ફરિયાદ સંબંધિત વિભાગને મોકલી દેવામાં આવી છે અને ટૂંક સમયમાં કાર્યવાહી કરવામાં આવશે.', '2026-05-02 14:10:08.505763', 'Water Resources', 'PENDING', 'MEDIUM', 'Unknown', 'Satyanarayan Society, Yogichowk area, Varachha zone', NULL, NULL);
INSERT INTO public.complaints (id, summary, full_log, created_at, department, status, priority, complainant_name, location, assigned_officer_id, complainant_email) VALUES (7, 'Three-day power cut issue', 'ASSISTANT: Hello! This is the Government Services Department. How can I help you today?
ASSISTANT: Hello! This
USER:  Hello.
ASSISTANT: This is the Government Services Department. How can I help you today? May I please know your current zone or specific location?
ASSISTANT: સમજી શકાય
USER:  અને વરાછા એ મારો જોન છે
ASSISTANT: સમજી શકાય છે. આપનો પ્રશ્ન કયા વિભાગ સાથે સંબંધિત છે? (જેમ કે પાણી, અગ્નિશમન, રસ્તા, કચરા વ્યવસ્થાપન વગેરે)
USER:  મારો પ્રશ્ન ઇલેક્ટ્રિક વિભાગ રિલેટેડ છે
ASSISTANT: ઇલેક્ટ્રિક વિભાગ માટે, શું આપ મને ચોક્કસ સરનામું, સમસ્યાનો પ્રકાર (જેમ કે પાવર કટ, ઢીલા વાયર, વગેરે) અને અન્ય કોઈ વિગતો આપી શકો છો?
ASSISTANT: ક્યારથી આ
USER:  કર્મભૂમિ સોસાયટીમાં આવે છે.
ASSISTANT: ક્યારથી આ સમસ્યા ચાલુ છે?
USER:  આ સમસ્યા છેલ્લા ત્રણ દિવસથી ચાલે છે
ASSISTANT: ઠીક છે. તો, હું આપની ફરિયાદ ઇલેક્ટ્રિક વિભાગમાં નોંધી રહ્યો છું. આપનું સરનામું છે: વરાછા યોગી ચોક કર્મભૂમિ સોસાયટી, અને છેલ્લા ત્રણ દિવસથી પાવર કટની સમસ્યા છે. શું આ વિગતો સાચી છે?
USER:  હા સાચી છે
ASSISTANT: મેં આપની ફરિયાદ નોંધી લીધી છે. સંબંધિત વિભાગ ટૂંક સમયમાં આપનો સંપર્ક કરશે. મદદ કરવા બદલ આભાર.', '2026-05-02 14:19:16.471588', 'd3', 'PENDING', 'HIGH', 'Unknown', 'Varacha Yogi Chowk Karmabhoomi Society', 'u1', NULL);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: aditya
--

INSERT INTO public.departments (id, name, description, parent_id, head_officer_id, priority_level, sla_days, created_at) VALUES ('d2', 'Roads & Transport', 'Urban road maintenance and planning', NULL, 'u3', 'HIGH', 7, '2026-05-02 13:29:52.97005');
INSERT INTO public.departments (id, name, description, parent_id, head_officer_id, priority_level, sla_days, created_at) VALUES ('d3', 'Electricity', 'Power grid maintenance', NULL, 'u1', 'MEDIUM', 2, '2026-05-02 13:29:52.97005');
INSERT INTO public.departments (id, name, description, parent_id, head_officer_id, priority_level, sla_days, created_at) VALUES ('d1', 'Water Resources', 'Management of water supply and sewage', NULL, 'u2', 'HIGH', 100, '2026-05-02 13:29:52.97005');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: aditya
--

INSERT INTO public.users (id, name, email, role, department_id, avatar_url, created_at) VALUES ('u3', 'Suresh Singh', 'suresh.roads@gov.in', 'OFFICER', 'd2', 'https://picsum.photos/seed/u3/200', '2026-05-02 13:40:42.215204');
INSERT INTO public.users (id, name, email, role, department_id, avatar_url, created_at) VALUES ('u1', 'Aditya Rathod', 'rathodaditya26656@gmail.com', 'DEPT_ADMIN', 'd3', 'https://picsum.photos/seed/u1/200', '2026-05-02 13:40:42.215204');
INSERT INTO public.users (id, name, email, role, department_id, avatar_url, created_at) VALUES ('u-1777711367921', 'John Dow', 'job@gmail.com', 'DEPT_ADMIN', 'd1', 'https://api.dicebear.com/7.x/initials/svg?seed=John Dow', '2026-05-02 14:12:47.92211');


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aditya
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 23, true);


--
-- Name: complaints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aditya
--

SELECT pg_catalog.setval('public.complaints_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

\unrestrict IJavyy0HhcZZQyBiWDwHbqduuF4EMXmjz8dTwxEZrqJUawX3DA74IRj8pfE9Ulm

