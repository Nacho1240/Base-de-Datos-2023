--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: comunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunas (
    id integer NOT NULL,
    nombre character varying(50),
    region character varying(30),
    fase integer
);


ALTER TABLE public.comunas OWNER TO postgres;

--
-- Name: comunas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comunas_id_seq OWNER TO postgres;

--
-- Name: comunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comunas_id_seq OWNED BY public.comunas.id;


--
-- Name: inoculacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inoculacion (
    id integer NOT NULL,
    vacuna_id integer,
    vacunatorio_id integer,
    rut character varying(10),
    fecha_1_dosis date,
    fecha_2_dosis date,
    fecha_3_dosis date,
    fecha_4_dosis date
);


ALTER TABLE public.inoculacion OWNER TO postgres;

--
-- Name: inoculacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inoculacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inoculacion_id_seq OWNER TO postgres;

--
-- Name: inoculacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inoculacion_id_seq OWNED BY public.inoculacion.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    rut character varying(10) NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    email character varying(50),
    telefono numeric
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: vacunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacunas (
    id integer NOT NULL,
    vacuna character varying(50),
    laboratorio character varying(50)
);


ALTER TABLE public.vacunas OWNER TO postgres;

--
-- Name: vacunas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacunas_id_seq OWNER TO postgres;

--
-- Name: vacunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacunas_id_seq OWNED BY public.vacunas.id;


--
-- Name: vacunatorios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacunatorios (
    id integer NOT NULL,
    nombre character varying(50),
    direccion character varying(100),
    comuna_id integer
);


ALTER TABLE public.vacunatorios OWNER TO postgres;

--
-- Name: vacunatorios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacunatorios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacunatorios_id_seq OWNER TO postgres;

--
-- Name: vacunatorios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacunatorios_id_seq OWNED BY public.vacunatorios.id;


--
-- Name: comunas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas ALTER COLUMN id SET DEFAULT nextval('public.comunas_id_seq'::regclass);


--
-- Name: inoculacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inoculacion ALTER COLUMN id SET DEFAULT nextval('public.inoculacion_id_seq'::regclass);


--
-- Name: vacunas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas ALTER COLUMN id SET DEFAULT nextval('public.vacunas_id_seq'::regclass);


--
-- Name: vacunatorios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunatorios ALTER COLUMN id SET DEFAULT nextval('public.vacunatorios_id_seq'::regclass);


--
-- Data for Name: comunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunas (id, nombre, region, fase) FROM stdin;
2	Maipu	Metropolitana	3
3	Ñuñoa	Metropolitana	3
1	Providencia	Metropolitana	2
4	Las Condes	Metropolitana	2
5	Santiago	Metropolitana	2
\.


--
-- Data for Name: inoculacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inoculacion (id, vacuna_id, vacunatorio_id, rut, fecha_1_dosis, fecha_2_dosis, fecha_3_dosis, fecha_4_dosis) FROM stdin;
1	1	1	111-k	2021-03-12	2021-08-12	2021-01-01	\N
3	3	3	101-k	2021-03-12	2021-08-12	2021-01-01	\N
4	1	1	121-k	2021-03-12	2021-08-12	2021-01-01	\N
5	1	1	126-7	2021-03-12	2021-08-12	2021-01-01	\N
6	2	3	126-7	2021-03-12	2021-08-12	2021-01-01	\N
7	3	1	116-4	2021-03-12	2021-08-12	2021-01-01	\N
2	2	2	131-k	2021-03-12	2021-08-12	2021-01-01	\N
8	4	1	116-4	2021-03-12	2021-08-12	2021-01-01	\N
9	4	3	126-7	2021-03-12	2021-08-12	2021-01-01	\N
10	1	4	126-7	2021-03-12	2021-08-12	2021-01-01	\N
11	1	4	121-k	2021-03-12	2021-08-12	2021-01-01	\N
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (rut, nombre, apellido, email, telefono) FROM stdin;
123-k	Jose Manuel	Estauruaga tercero	dogshow@email.cl	876356574
111-k	Juanin Juan	Jarry	jjj@email.cl	8763564434
131-k	Patana	Tribiño	patana@email.cl	96537859
101-k	Balon	BOn bola	bbb@email.cl	76583958
121-k	Maguito	Show	quieromyshow@email.cl	89560743
126-7	Mico	Micofono	mm@email.cl	86043278
136-1	Juan Carlos	Bodoque	jcbodoque@email.cl	97685435
116-4	Policarpo	Avendaño	policarpo@email.cl	97503456
\.


--
-- Data for Name: vacunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacunas (id, vacuna, laboratorio) FROM stdin;
1	Moderna	Umbrella
2	Pfizer	Umbrella
3	Astrazeneca	Umbrella
4	Chinchu Lee	China Labs
5	Anti Z	China Labs
\.


--
-- Data for Name: vacunatorios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacunatorios (id, nombre, direccion, comuna_id) FROM stdin;
2	Hospital Hermano bueno	Gladis Marin	2
3	Hospital Orange Salud	Calle sin Salida 124	3
4	Clinica San Clemente	Ing Sharseneger	4
5	Clinica Jesus de Nazaret	Doctor Wiliam Walase 456	1
1	Clinica Agilas de altas cumbres	Argentina 324	1
\.


--
-- Name: comunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comunas_id_seq', 5, true);


--
-- Name: inoculacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inoculacion_id_seq', 11, true);


--
-- Name: vacunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacunas_id_seq', 5, true);


--
-- Name: vacunatorios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacunatorios_id_seq', 5, true);


--
-- Name: comunas comunas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunas
    ADD CONSTRAINT comunas_pk PRIMARY KEY (id);


--
-- Name: inoculacion inoculacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inoculacion
    ADD CONSTRAINT inoculacion_pk PRIMARY KEY (id);


--
-- Name: personas personas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pk PRIMARY KEY (rut);


--
-- Name: vacunas vacunas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas
    ADD CONSTRAINT vacunas_pk PRIMARY KEY (id);


--
-- Name: vacunatorios vacunatorios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunatorios
    ADD CONSTRAINT vacunatorios_pk PRIMARY KEY (id);


--
-- Name: vacunatorios comuna_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunatorios
    ADD CONSTRAINT comuna_id FOREIGN KEY (comuna_id) REFERENCES public.comunas(id);


--
-- Name: inoculacion rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inoculacion
    ADD CONSTRAINT rut FOREIGN KEY (rut) REFERENCES public.personas(rut);


--
-- Name: inoculacion vacuna_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inoculacion
    ADD CONSTRAINT vacuna_id FOREIGN KEY (vacuna_id) REFERENCES public.vacunas(id);


--
-- Name: inoculacion vacunatorio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inoculacion
    ADD CONSTRAINT vacunatorio_id FOREIGN KEY (vacunatorio_id) REFERENCES public.vacunatorios(id);


--
-- PostgreSQL database dump complete
--

