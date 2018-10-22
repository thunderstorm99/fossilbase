--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: deposits; Type: TABLE; Schema: public; Owner: fossilbase
--

CREATE TABLE public.deposits (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint NOT NULL,
    user_id_entry bigint NOT NULL,
    gps_lat double precision[]
);


ALTER TABLE public.deposits OWNER TO fossilbase;

--
-- Name: deposits_id_seq; Type: SEQUENCE; Schema: public; Owner: fossilbase
--

CREATE SEQUENCE public.deposits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposits_id_seq OWNER TO fossilbase;

--
-- Name: deposits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fossilbase
--

ALTER SEQUENCE public.deposits_id_seq OWNED BY public.deposits.id;


--
-- Name: fossils; Type: TABLE; Schema: public; Owner: fossilbase
--

CREATE TABLE public.fossils (
    id bigint NOT NULL,
    date_entry timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name_common character varying(100),
    user_id_entry bigint NOT NULL,
    deposit_id bigint NOT NULL
);


ALTER TABLE public.fossils OWNER TO fossilbase;

--
-- Name: fossils_id_seq; Type: SEQUENCE; Schema: public; Owner: fossilbase
--

CREATE SEQUENCE public.fossils_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fossils_id_seq OWNER TO fossilbase;

--
-- Name: fossils_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fossilbase
--

ALTER SEQUENCE public.fossils_id_seq OWNED BY public.fossils.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: fossilbase
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    user_id_entry bigint NOT NULL
);


ALTER TABLE public.locations OWNER TO fossilbase;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: fossilbase
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO fossilbase;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fossilbase
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: fossilbase
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO fossilbase;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fossilbase
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fossilbase;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fossilbase
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: deposits id; Type: DEFAULT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.deposits ALTER COLUMN id SET DEFAULT nextval('public.deposits_id_seq'::regclass);


--
-- Name: fossils id; Type: DEFAULT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.fossils ALTER COLUMN id SET DEFAULT nextval('public.fossils_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: deposits; Type: TABLE DATA; Schema: public; Owner: fossilbase
--

COPY public.deposits (id, name, location_id, user_id_entry, gps_lat) FROM stdin;
1	La Mula	1	1	\N
2	Museo de la Paleontologia Muzquiz	1	2	{27.8643250000000009,-101.527323999999993}
\.


--
-- Data for Name: fossils; Type: TABLE DATA; Schema: public; Owner: fossilbase
--

COPY public.fossils (id, date_entry, name_common, user_id_entry, deposit_id) FROM stdin;
1	2018-10-22 16:19:54.180035	Regalecus glesne	2	1
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: fossilbase
--

COPY public.locations (id, name, user_id_entry) FROM stdin;
1	Múzquiz Municipality	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fossilbase
--

COPY public.users (id, name) FROM stdin;
1	Nils Jakobi
2	Eva Susanne Stinnesbeck
\.


--
-- Name: deposits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fossilbase
--

SELECT pg_catalog.setval('public.deposits_id_seq', 2, true);


--
-- Name: fossils_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fossilbase
--

SELECT pg_catalog.setval('public.fossils_id_seq', 1, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fossilbase
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fossilbase
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: deposits deposits_pk; Type: CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_pk PRIMARY KEY (id);


--
-- Name: fossils fossils_pk; Type: CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.fossils
    ADD CONSTRAINT fossils_pk PRIMARY KEY (id);


--
-- Name: locations locations_pk; Type: CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: deposits deposits_locations_fk; Type: FK CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_locations_fk FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: deposits deposits_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_users_fk FOREIGN KEY (user_id_entry) REFERENCES public.users(id);


--
-- Name: fossils fossils_deposits_fk; Type: FK CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.fossils
    ADD CONSTRAINT fossils_deposits_fk FOREIGN KEY (deposit_id) REFERENCES public.deposits(id);


--
-- Name: fossils fossils_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.fossils
    ADD CONSTRAINT fossils_users_fk FOREIGN KEY (user_id_entry) REFERENCES public.users(id);


--
-- Name: locations locations_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: fossilbase
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_users_fk FOREIGN KEY (user_id_entry) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

