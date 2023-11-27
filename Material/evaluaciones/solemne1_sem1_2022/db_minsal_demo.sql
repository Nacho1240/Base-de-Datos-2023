-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: minsal2 | type: DATABASE --
-- DROP DATABASE IF EXISTS minsal2;
CREATE DATABASE minsal2;
-- ddl-end --


-- object: public.comunas | type: TABLE --
-- DROP TABLE IF EXISTS public.comunas CASCADE;
CREATE TABLE public.comunas (
	id serial NOT NULL,
	nombre varchar(50),
	region varchar(30),
	fase integer,
	CONSTRAINT comunas_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.comunas OWNER TO postgres;
-- ddl-end --

-- object: public.vacunatorios | type: TABLE --
-- DROP TABLE IF EXISTS public.vacunatorios CASCADE;
CREATE TABLE public.vacunatorios (
	id serial NOT NULL,
	nombre varchar(50),
	direccion varchar(100),
	comuna_id integer,
	CONSTRAINT vacunatorios_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.vacunatorios OWNER TO postgres;
-- ddl-end --

-- object: public.vacunas | type: TABLE --
-- DROP TABLE IF EXISTS public.vacunas CASCADE;
CREATE TABLE public.vacunas (
	id serial NOT NULL,
	vacuna varchar(50),
	laboratorio varchar(50),
	CONSTRAINT vacunas_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.vacunas OWNER TO postgres;
-- ddl-end --

-- object: public.inoculacion | type: TABLE --
-- DROP TABLE IF EXISTS public.inoculacion CASCADE;
CREATE TABLE public.inoculacion (
	id serial NOT NULL,
	vacuna_id integer,
	vacunatorio_id integer,
	rut varchar(10),
	fecha_1_dosis date,
	fecha_2_dosis date,
	fecha_3_dosis date,
	fecha_4_dosis date,
	CONSTRAINT inoculacion_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.inoculacion OWNER TO postgres;
-- ddl-end --

-- object: public.personas | type: TABLE --
-- DROP TABLE IF EXISTS public.personas CASCADE;
CREATE TABLE public.personas (
	rut varchar(10) NOT NULL,
	nombre varchar(50),
	apellido varchar(50),
	email varchar(50),
	telefono numeric,
	CONSTRAINT personas_pk PRIMARY KEY (rut)
);
-- ddl-end --
ALTER TABLE public.personas OWNER TO postgres;
-- ddl-end --

-- object: comuna_id | type: CONSTRAINT --
-- ALTER TABLE public.vacunatorios DROP CONSTRAINT IF EXISTS comuna_id CASCADE;
ALTER TABLE public.vacunatorios ADD CONSTRAINT comuna_id FOREIGN KEY (comuna_id)
REFERENCES public.comunas (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: vacuna_id | type: CONSTRAINT --
-- ALTER TABLE public.inoculacion DROP CONSTRAINT IF EXISTS vacuna_id CASCADE;
ALTER TABLE public.inoculacion ADD CONSTRAINT vacuna_id FOREIGN KEY (vacuna_id)
REFERENCES public.vacunas (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: vacunatorio_id | type: CONSTRAINT --
-- ALTER TABLE public.inoculacion DROP CONSTRAINT IF EXISTS vacunatorio_id CASCADE;
ALTER TABLE public.inoculacion ADD CONSTRAINT vacunatorio_id FOREIGN KEY (vacunatorio_id)
REFERENCES public.vacunatorios (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: rut | type: CONSTRAINT --
-- ALTER TABLE public.inoculacion DROP CONSTRAINT IF EXISTS rut CASCADE;
ALTER TABLE public.inoculacion ADD CONSTRAINT rut FOREIGN KEY (rut)
REFERENCES public.personas (rut) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


