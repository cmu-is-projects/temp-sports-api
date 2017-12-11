--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: wcalat
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO wcalat;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: wcalat
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO wcalat;

--
-- Name: surveys; Type: TABLE; Schema: public; Owner: wcalat
--

CREATE TABLE surveys (
    id bigint NOT NULL,
    survey_type character varying,
    response character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    completed_on timestamp without time zone,
    user_id integer
);


ALTER TABLE surveys OWNER TO wcalat;

--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: wcalat
--

CREATE SEQUENCE surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surveys_id_seq OWNER TO wcalat;

--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wcalat
--

ALTER SEQUENCE surveys_id_seq OWNED BY surveys.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: wcalat
--

CREATE TABLE teams (
    id bigint NOT NULL,
    name character varying,
    gender character varying,
    season character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE teams OWNER TO wcalat;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: wcalat
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO wcalat;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wcalat
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: wcalat
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    "andrewID" character varying,
    major character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying,
    "studentClass" character varying,
    team_id integer
);


ALTER TABLE users OWNER TO wcalat;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: wcalat
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO wcalat;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wcalat
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: surveys id; Type: DEFAULT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY surveys ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: wcalat
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-12-07 10:08:52.98551	2017-12-07 10:08:52.98551
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: wcalat
--

COPY schema_migrations (version) FROM stdin;
20171204211452
20171204213147
20171204222323
20171204232607
20171205005352
20171205061445
20171205080210
20171205082636
\.


--
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: wcalat
--

COPY surveys (id, survey_type, response, created_at, updated_at, completed_on, user_id) FROM stdin;
\.


--
-- Name: surveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wcalat
--

SELECT pg_catalog.setval('surveys_id_seq', 1, false);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: wcalat
--

COPY teams (id, name, gender, season, created_at, updated_at) FROM stdin;
1	'Women's Volleyball'	Women	fall	2017-12-07 16:21:52.966248	2017-12-07 16:21:52.966248
2	'Men's Soccer'	Men	fall	2017-12-07 16:22:04.883469	2017-12-07 16:22:04.883469
3	'Women's Basketball'	Women	fall	2017-12-08 03:39:30.481449	2017-12-08 03:39:30.481449
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wcalat
--

SELECT pg_catalog.setval('teams_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: wcalat
--

COPY users (id, first_name, last_name, "andrewID", major, created_at, updated_at, password_digest, "studentClass", team_id) FROM stdin;
1	Alec	Lam	ahlam	is	2017-12-07 16:22:25.482367	2017-12-07 16:22:25.482367	$2a$10$eFdQryXc8WM6QX/FI.VbGu4UnM6z0434oODYvPcv8rJdmb58WISLC	JR	1
2	Greg	Bellwoar	gbellwoa	business	2017-12-07 16:22:45.428356	2017-12-07 16:22:45.428356	$2a$10$FuA2kfVRv4chNRw81LwA.O0uTDmv3WzXgfqC4sxI1sQySRd0Ik.ie	JR	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wcalat
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: wcalat
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
