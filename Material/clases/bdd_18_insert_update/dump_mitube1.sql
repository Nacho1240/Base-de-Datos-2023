--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario (
    id_comentario integer NOT NULL,
    id_video integer,
    texto character varying(500) NOT NULL,
    id_usuario integer
);


ALTER TABLE public.comentario OWNER TO postgres;

--
-- Name: comentario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentario_id_comentario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_id_comentario_seq OWNER TO postgres;

--
-- Name: comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentario_id_comentario_seq OWNED BY public.comentario.id_comentario;


--
-- Name: etiquetas_video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etiquetas_video (
    id_etiqueta_video integer NOT NULL,
    id_tag integer,
    id_video integer
);


ALTER TABLE public.etiquetas_video OWNER TO postgres;

--
-- Name: etiquetas_video_id_etiqueta_video_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etiquetas_video_id_etiqueta_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etiquetas_video_id_etiqueta_video_seq OWNER TO postgres;

--
-- Name: etiquetas_video_id_etiqueta_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etiquetas_video_id_etiqueta_video_seq OWNED BY public.etiquetas_video.id_etiqueta_video;


--
-- Name: lista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista (
    id_lista integer NOT NULL,
    nombre character varying(50),
    id_usuario integer
);


ALTER TABLE public.lista OWNER TO postgres;

--
-- Name: lista_id_lista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lista_id_lista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lista_id_lista_seq OWNER TO postgres;

--
-- Name: lista_id_lista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lista_id_lista_seq OWNED BY public.lista.id_lista;


--
-- Name: lista_video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_video (
    id_lista integer,
    id_video integer
);


ALTER TABLE public.lista_video OWNER TO postgres;

--
-- Name: percepcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.percepcion (
    id_percepcion integer NOT NULL,
    id_video integer,
    id_tipo_feed_back integer,
    id_usuario integer
);


ALTER TABLE public.percepcion OWNER TO postgres;

--
-- Name: percepcion_id_percepcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.percepcion_id_percepcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.percepcion_id_percepcion_seq OWNER TO postgres;

--
-- Name: percepcion_id_percepcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.percepcion_id_percepcion_seq OWNED BY public.percepcion.id_percepcion;


--
-- Name: suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suscripcion (
    id_usuario integer,
    id_suscrito integer
);


ALTER TABLE public.suscripcion OWNER TO postgres;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    nombre character varying(10) NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tipo_feed_back; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_feed_back (
    id_feed_back integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipo_feed_back OWNER TO postgres;

--
-- Name: tipo_feed_back_id_feed_back_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_feed_back_id_feed_back_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_feed_back_id_feed_back_seq OWNER TO postgres;

--
-- Name: tipo_feed_back_id_feed_back_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_feed_back_id_feed_back_seq OWNED BY public.tipo_feed_back.id_feed_back;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nickname character varying(50) NOT NULL,
    correo character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video (
    id_video integer NOT NULL,
    titulo character varying(50) NOT NULL,
    media character varying(100) NOT NULL,
    descrip character varying(200),
    fecha date DEFAULT CURRENT_DATE,
    place character varying(50)
);


ALTER TABLE public.video OWNER TO postgres;

--
-- Name: video_id_video_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_video_seq OWNER TO postgres;

--
-- Name: video_id_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;


--
-- Name: comentario id_comentario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario ALTER COLUMN id_comentario SET DEFAULT nextval('public.comentario_id_comentario_seq'::regclass);


--
-- Name: etiquetas_video id_etiqueta_video; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas_video ALTER COLUMN id_etiqueta_video SET DEFAULT nextval('public.etiquetas_video_id_etiqueta_video_seq'::regclass);


--
-- Name: lista id_lista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista ALTER COLUMN id_lista SET DEFAULT nextval('public.lista_id_lista_seq'::regclass);


--
-- Name: percepcion id_percepcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.percepcion ALTER COLUMN id_percepcion SET DEFAULT nextval('public.percepcion_id_percepcion_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tipo_feed_back id_feed_back; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_feed_back ALTER COLUMN id_feed_back SET DEFAULT nextval('public.tipo_feed_back_id_feed_back_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: video id_video; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);


--
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario (id_comentario, id_video, texto, id_usuario) FROM stdin;
\.


--
-- Data for Name: etiquetas_video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etiquetas_video (id_etiqueta_video, id_tag, id_video) FROM stdin;
\.


--
-- Data for Name: lista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista (id_lista, nombre, id_usuario) FROM stdin;
\.


--
-- Data for Name: lista_video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_video (id_lista, id_video) FROM stdin;
\.


--
-- Data for Name: percepcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.percepcion (id_percepcion, id_video, id_tipo_feed_back, id_usuario) FROM stdin;
\.


--
-- Data for Name: suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suscripcion (id_usuario, id_suscrito) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (id, nombre) FROM stdin;
\.


--
-- Data for Name: tipo_feed_back; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_feed_back (id_feed_back, nombre) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nickname, correo, password) FROM stdin;
1	FakeNick	fake@mail.com	bm9sYXNlLjEK
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.video (id_video, titulo, media, descrip, fecha, place) FROM stdin;
1	Arch Enemy - Sunset Over The Empire	https://youtu.be/E3mOvCMG24I	New single "Sunset Over The Empire" out everywhere!	2023-05-23	\N
2	Hans Zimmer performs INCEPTION "Time"	https://youtu.be/xdYYN-4ttDg	at Hollywood in Vienna 2018	2022-05-25	\N
\.


--
-- Name: comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentario_id_comentario_seq', 1, false);


--
-- Name: etiquetas_video_id_etiqueta_video_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etiquetas_video_id_etiqueta_video_seq', 1, false);


--
-- Name: lista_id_lista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lista_id_lista_seq', 1, false);


--
-- Name: percepcion_id_percepcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.percepcion_id_percepcion_seq', 1, false);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tipo_feed_back_id_feed_back_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_feed_back_id_feed_back_seq', 1, false);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, true);


--
-- Name: video_id_video_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_id_video_seq', 2, true);


--
-- Name: comentario id_comentario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT id_comentario PRIMARY KEY (id_comentario);


--
-- Name: etiquetas_video id_etiqueda_video; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas_video
    ADD CONSTRAINT id_etiqueda_video PRIMARY KEY (id_etiqueta_video);


--
-- Name: lista id_lista; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT id_lista PRIMARY KEY (id_lista);


--
-- Name: percepcion id_percepcion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.percepcion
    ADD CONSTRAINT id_percepcion PRIMARY KEY (id_percepcion);


--
-- Name: tag id_tag; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT id_tag PRIMARY KEY (id);


--
-- Name: tipo_feed_back id_tipo_feed_back; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_feed_back
    ADD CONSTRAINT id_tipo_feed_back PRIMARY KEY (id_feed_back);


--
-- Name: usuario id_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- Name: video id_video; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT id_video PRIMARY KEY (id_video);


--
-- Name: lista_video id_lista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_video
    ADD CONSTRAINT id_lista FOREIGN KEY (id_lista) REFERENCES public.lista(id_lista);


--
-- Name: suscripcion id_suscrito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT id_suscrito FOREIGN KEY (id_suscrito) REFERENCES public.usuario(id_usuario);


--
-- Name: etiquetas_video id_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas_video
    ADD CONSTRAINT id_tag FOREIGN KEY (id_tag) REFERENCES public.tag(id);


--
-- Name: percepcion id_tipo_feed_back; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.percepcion
    ADD CONSTRAINT id_tipo_feed_back FOREIGN KEY (id_tipo_feed_back) REFERENCES public.tipo_feed_back(id_feed_back);


--
-- Name: percepcion id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.percepcion
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: comentario id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: lista id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: suscripcion id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: percepcion id_video; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.percepcion
    ADD CONSTRAINT id_video FOREIGN KEY (id_video) REFERENCES public.video(id_video);


--
-- Name: comentario id_video; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT id_video FOREIGN KEY (id_video) REFERENCES public.video(id_video);


--
-- Name: lista_video id_video; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_video
    ADD CONSTRAINT id_video FOREIGN KEY (id_video) REFERENCES public.video(id_video);


--
-- Name: etiquetas_video id_video; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiquetas_video
    ADD CONSTRAINT id_video FOREIGN KEY (id_video) REFERENCES public.video(id_video);


--
-- PostgreSQL database dump complete
--

