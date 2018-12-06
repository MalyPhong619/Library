--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

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
-- Name: books; Type: TABLE; Schema: public; Owner: CHILL
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying,
    amount integer
);


ALTER TABLE public.books OWNER TO "CHILL";

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: CHILL
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO "CHILL";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CHILL
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: checkouts; Type: TABLE; Schema: public; Owner: CHILL
--

CREATE TABLE public.checkouts (
    id integer NOT NULL,
    book_id integer,
    patron_id integer
);


ALTER TABLE public.checkouts OWNER TO "CHILL";

--
-- Name: checkouts_id_seq; Type: SEQUENCE; Schema: public; Owner: CHILL
--

CREATE SEQUENCE public.checkouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkouts_id_seq OWNER TO "CHILL";

--
-- Name: checkouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CHILL
--

ALTER SEQUENCE public.checkouts_id_seq OWNED BY public.checkouts.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: CHILL
--

CREATE TABLE public.patrons (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.patrons OWNER TO "CHILL";

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: CHILL
--

CREATE SEQUENCE public.patrons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patrons_id_seq OWNER TO "CHILL";

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CHILL
--

ALTER SEQUENCE public.patrons_id_seq OWNED BY public.patrons.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: checkouts id; Type: DEFAULT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.checkouts ALTER COLUMN id SET DEFAULT nextval('public.checkouts_id_seq'::regclass);


--
-- Name: patrons id; Type: DEFAULT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.patrons ALTER COLUMN id SET DEFAULT nextval('public.patrons_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: CHILL
--

COPY public.books (id, title, amount) FROM stdin;
1	treasure island	\N
\.


--
-- Data for Name: checkouts; Type: TABLE DATA; Schema: public; Owner: CHILL
--

COPY public.checkouts (id, book_id, patron_id) FROM stdin;
\.


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: CHILL
--

COPY public.patrons (id, name) FROM stdin;
9	chris
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CHILL
--

SELECT pg_catalog.setval('public.books_id_seq', 1, true);


--
-- Name: checkouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CHILL
--

SELECT pg_catalog.setval('public.checkouts_id_seq', 1, false);


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CHILL
--

SELECT pg_catalog.setval('public.patrons_id_seq', 9, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: checkouts checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.checkouts
    ADD CONSTRAINT checkouts_pkey PRIMARY KEY (id);


--
-- Name: patrons patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: CHILL
--

ALTER TABLE ONLY public.patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

