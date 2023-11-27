-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "miTube" | type: DATABASE --
-- DROP DATABASE IF EXISTS "miTube";
CREATE DATABASE "miTube";
-- ddl-end --


-- object: public.video | type: TABLE --
-- DROP TABLE IF EXISTS public.video CASCADE;
CREATE TABLE public.video (
	id_video serial NOT NULL,
	titulo varchar(50) NOT NULL,
	media varchar(100) NOT NULL,
	descrip varchar(200),
	fecha date DEFAULT CURRENT_DATE,
	place varchar(50),
	CONSTRAINT id_video PRIMARY KEY (id_video)
);
-- ddl-end --
ALTER TABLE public.video OWNER TO postgres;
-- ddl-end --

-- object: public.percepcion | type: TABLE --
-- DROP TABLE IF EXISTS public.percepcion CASCADE;
CREATE TABLE public.percepcion (
	id_percepcion serial NOT NULL,
	id_video integer,
	id_tipo_feed_back integer,
	id_usuario integer,
	CONSTRAINT id_percepcion PRIMARY KEY (id_percepcion)
);
-- ddl-end --
ALTER TABLE public.percepcion OWNER TO postgres;
-- ddl-end --

-- object: public.tipo_feed_back | type: TABLE --
-- DROP TABLE IF EXISTS public.tipo_feed_back CASCADE;
CREATE TABLE public.tipo_feed_back (
	id_feed_back serial NOT NULL,
	nombre varchar(50) NOT NULL,
	CONSTRAINT id_tipo_feed_back PRIMARY KEY (id_feed_back)
);
-- ddl-end --
ALTER TABLE public.tipo_feed_back OWNER TO postgres;
-- ddl-end --

-- object: public.comentario | type: TABLE --
-- DROP TABLE IF EXISTS public.comentario CASCADE;
CREATE TABLE public.comentario (
	id_comentario serial NOT NULL,
	id_video integer,
	texto varchar(500) NOT NULL,
	id_usuario integer,
	CONSTRAINT id_comentario PRIMARY KEY (id_comentario)
);
-- ddl-end --
ALTER TABLE public.comentario OWNER TO postgres;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario (
	id_usuario serial NOT NULL,
	nickname varchar(50) NOT NULL,
	correo varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	CONSTRAINT id_usuario PRIMARY KEY (id_usuario)
);
-- ddl-end --
ALTER TABLE public.usuario OWNER TO postgres;
-- ddl-end --

-- object: public.lista | type: TABLE --
-- DROP TABLE IF EXISTS public.lista CASCADE;
CREATE TABLE public.lista (
	id_lista serial NOT NULL,
	nombre varchar(50),
	id_usuario integer,
	CONSTRAINT id_lista PRIMARY KEY (id_lista)
);
-- ddl-end --
ALTER TABLE public.lista OWNER TO postgres;
-- ddl-end --

-- object: public.lista_video | type: TABLE --
-- DROP TABLE IF EXISTS public.lista_video CASCADE;
CREATE TABLE public.lista_video (
	id_lista integer,
	id_video integer

);
-- ddl-end --
ALTER TABLE public.lista_video OWNER TO postgres;
-- ddl-end --

-- object: public.suscripcion | type: TABLE --
-- DROP TABLE IF EXISTS public.suscripcion CASCADE;
CREATE TABLE public.suscripcion (
	id_usuario integer,
	id_suscrito integer

);
-- ddl-end --
ALTER TABLE public.suscripcion OWNER TO postgres;
-- ddl-end --

-- object: public.etiquetas_video | type: TABLE --
-- DROP TABLE IF EXISTS public.etiquetas_video CASCADE;
CREATE TABLE public.etiquetas_video (
	id_etiqueta_video serial NOT NULL,
	id_tag integer,
	id_video integer,
	CONSTRAINT id_etiqueda_video PRIMARY KEY (id_etiqueta_video)
);
-- ddl-end --
ALTER TABLE public.etiquetas_video OWNER TO postgres;
-- ddl-end --

-- object: public.tag | type: TABLE --
-- DROP TABLE IF EXISTS public.tag CASCADE;
CREATE TABLE public.tag (
	id serial NOT NULL,
	nombre varchar(10) NOT NULL,
	CONSTRAINT id_tag PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.tag OWNER TO postgres;
-- ddl-end --

-- object: id_video | type: CONSTRAINT --
-- ALTER TABLE public.percepcion DROP CONSTRAINT IF EXISTS id_video CASCADE;
ALTER TABLE public.percepcion ADD CONSTRAINT id_video FOREIGN KEY (id_video)
REFERENCES public.video (id_video) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_tipo_feed_back | type: CONSTRAINT --
-- ALTER TABLE public.percepcion DROP CONSTRAINT IF EXISTS id_tipo_feed_back CASCADE;
ALTER TABLE public.percepcion ADD CONSTRAINT id_tipo_feed_back FOREIGN KEY (id_tipo_feed_back)
REFERENCES public.tipo_feed_back (id_feed_back) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_usuario | type: CONSTRAINT --
-- ALTER TABLE public.percepcion DROP CONSTRAINT IF EXISTS id_usuario CASCADE;
ALTER TABLE public.percepcion ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_video | type: CONSTRAINT --
-- ALTER TABLE public.comentario DROP CONSTRAINT IF EXISTS id_video CASCADE;
ALTER TABLE public.comentario ADD CONSTRAINT id_video FOREIGN KEY (id_video)
REFERENCES public.video (id_video) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_usuario | type: CONSTRAINT --
-- ALTER TABLE public.comentario DROP CONSTRAINT IF EXISTS id_usuario CASCADE;
ALTER TABLE public.comentario ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_usuario | type: CONSTRAINT --
-- ALTER TABLE public.lista DROP CONSTRAINT IF EXISTS id_usuario CASCADE;
ALTER TABLE public.lista ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_lista | type: CONSTRAINT --
-- ALTER TABLE public.lista_video DROP CONSTRAINT IF EXISTS id_lista CASCADE;
ALTER TABLE public.lista_video ADD CONSTRAINT id_lista FOREIGN KEY (id_lista)
REFERENCES public.lista (id_lista) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_video | type: CONSTRAINT --
-- ALTER TABLE public.lista_video DROP CONSTRAINT IF EXISTS id_video CASCADE;
ALTER TABLE public.lista_video ADD CONSTRAINT id_video FOREIGN KEY (id_video)
REFERENCES public.video (id_video) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_suscrito | type: CONSTRAINT --
-- ALTER TABLE public.suscripcion DROP CONSTRAINT IF EXISTS id_suscrito CASCADE;
ALTER TABLE public.suscripcion ADD CONSTRAINT id_suscrito FOREIGN KEY (id_suscrito)
REFERENCES public.usuario (id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_usuario | type: CONSTRAINT --
-- ALTER TABLE public.suscripcion DROP CONSTRAINT IF EXISTS id_usuario CASCADE;
ALTER TABLE public.suscripcion ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_video | type: CONSTRAINT --
-- ALTER TABLE public.etiquetas_video DROP CONSTRAINT IF EXISTS id_video CASCADE;
ALTER TABLE public.etiquetas_video ADD CONSTRAINT id_video FOREIGN KEY (id_video)
REFERENCES public.video (id_video) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_tag | type: CONSTRAINT --
-- ALTER TABLE public.etiquetas_video DROP CONSTRAINT IF EXISTS id_tag CASCADE;
ALTER TABLE public.etiquetas_video ADD CONSTRAINT id_tag FOREIGN KEY (id_tag)
REFERENCES public.tag (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


