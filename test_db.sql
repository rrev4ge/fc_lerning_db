--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-1.pgdg18.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    address text
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_seq OWNER TO postgres;

--
-- Name: campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_id_seq OWNED BY public.campus.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    email character varying(32) NOT NULL,
    gender character varying(6)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_delivered boolean DEFAULT false,
    CONSTRAINT orders_created_at_check CHECK ((created_at <= CURRENT_TIMESTAMP))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    brand character varying(20) NOT NULL,
    model character varying(20) NOT NULL,
    price numeric(7,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    pcount integer DEFAULT 0,
    CONSTRAINT phones_pcount_check CHECK ((pcount >= 0)),
    CONSTRAINT phones_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_id_seq OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- Name: phones_to_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones_to_orders (
    id_phone integer NOT NULL,
    id_order integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT phones_to_orders_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.phones_to_orders OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    id_campus integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    caption character varying(60)
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: subjects_to_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects_to_students (
    id_student integer NOT NULL,
    id_subject integer NOT NULL
);


ALTER TABLE public.subjects_to_students OWNER TO postgres;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    deadline date
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    avg_mark real
);


ALTER TABLE public.test OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO postgres;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    email character varying(32),
    birthday date NOT NULL,
    address text,
    phone_number character(10),
    gender character varying(7),
    salary numeric,
    CONSTRAINT users_birthday_check CHECK ((birthday <= CURRENT_DATE)),
    CONSTRAINT users_gender_check CHECK ((((gender)::text = 'male'::text) OR ((gender)::text = 'female'::text) OR ((gender)::text = 'unknown'::text))),
    CONSTRAINT users_salary_check CHECK ((salary >= (0)::numeric))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: u1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.u1 AS
 SELECT users.id,
    users.first_name,
    users.last_name,
    users.email,
    users.birthday,
    users.address,
    users.phone_number,
    users.gender,
    users.salary
   FROM public.users;


ALTER TABLE public.u1 OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: campus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN id SET DEFAULT nextval('public.campus_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: phones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id, address) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, email, gender) FROM stdin;
1	test@test.test	male
2	test2@test.test	male
3	test2@test.gmail	female
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, id_user, created_at, is_delivered) FROM stdin;
1	1	2020-11-01 00:00:00	f
2	2	2020-10-01 00:00:00	f
3	3	2019-08-01 00:00:00	f
4	1	2019-01-01 00:00:00	f
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, brand, model, price, created_at, updated_at, pcount) FROM stdin;
2	IPhone	XXX	0.44	2020-11-07 19:28:27.276499	\N	5
5	IPhone	XXX2	8.44	2020-11-07 19:44:22.896779	\N	5
6	IPhone	XXX4	5.44	2020-11-07 19:44:57.567857	\N	5
7	IPhone	XAX4	5.44	2020-11-07 19:48:34.491931	\N	5
8	Samsung	5	8.44	2020-11-08 15:48:38.6173	\N	5
9	Samsung	6	3.44	2020-11-08 15:48:52.234402	\N	5
10	Samsung	7	2.44	2020-11-08 15:49:03.388331	\N	5
4	IPhone	XXX1	3.44	2020-11-07 19:44:22.896779	\N	10
\.


--
-- Data for Name: phones_to_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones_to_orders (id_phone, id_order, quantity) FROM stdin;
2	1	3
4	1	1
6	2	2
5	3	2
10	4	3
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, id_campus) FROM stdin;
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, caption) FROM stdin;
\.


--
-- Data for Name: subjects_to_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects_to_students (id_student, id_subject) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, deadline) FROM stdin;
1	2018-01-01
2	2020-11-14
3	2021-01-01
4	2018-01-01
5	2020-11-14
6	2022-01-01
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, avg_mark) FROM stdin;
1	3.5
2	4.5
3	2.4
4	3.5
5	4.5
6	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, birthday, address, phone_number, gender, salary) FROM stdin;
8	Ivan	Testovich	test6@test.test	1960-01-01	Main street 1/11	0999999999	female	10000
9	Test2	Testovich2	\N	2001-01-01	Test street, 13/14	0689999998	female	10000
10	Vasia	Testovich	test7@test.test	1950-01-01	Main street 1/11	0999999999	female	10000
11	Test11	Testovich2	\N	2011-01-01	Test street, 13/14	0689999998	female	10000
12	Vasia	Testovich	test8@test.test	1950-01-01	Main street 1/11	0999999999	female	10000
13	test11	Testovich2	\N	2011-01-01	Test street, 13/14	0689999998	female	10000
1	Test	Testovich	test@test.test	2001-01-01	Test street, 13/13	0999999999	male	12000
2	Test2	Testovich2	\N	2001-01-01	Test street, 13/14	0999999998	male	12000
3	Test3	Testovich	test3@test.test	2001-01-01	Test street, 13/13	0999999999	male	12000
4	Test4	Testovich2	\N	2001-01-01	Test street, 13/14	0999999998	male	12000
7	Test2	Testovich2	\N	2001-01-01	Test street, 13/14	0999999998	female	12000
6	Test	Testovich	test5@test.test	2010-01-01	Test street, 13/13	0999999999	unknown	12000
\.


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_seq', 1, false);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 3, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_seq', 11, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 6, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: phones phones_brand_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_brand_model_key UNIQUE (brand, model);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: phones_to_orders phones_to_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones_to_orders
    ADD CONSTRAINT phones_to_orders_pkey PRIMARY KEY (id_phone, id_order);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: subjects_to_students subjects_to_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_to_students
    ADD CONSTRAINT subjects_to_students_pkey PRIMARY KEY (id_student, id_subject);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: orders orders_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: phones_to_orders phones_to_orders_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones_to_orders
    ADD CONSTRAINT phones_to_orders_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: phones_to_orders phones_to_orders_id_phone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones_to_orders
    ADD CONSTRAINT phones_to_orders_id_phone_fkey FOREIGN KEY (id_phone) REFERENCES public.phones(id);


--
-- Name: students students_id_campus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_id_campus_fkey FOREIGN KEY (id_campus) REFERENCES public.campus(id);


--
-- Name: subjects_to_students subjects_to_students_id_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_to_students
    ADD CONSTRAINT subjects_to_students_id_student_fkey FOREIGN KEY (id_student) REFERENCES public.students(id);


--
-- Name: subjects_to_students subjects_to_students_id_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_to_students
    ADD CONSTRAINT subjects_to_students_id_subject_fkey FOREIGN KEY (id_subject) REFERENCES public.subjects(id);


--
-- PostgreSQL database dump complete
--

