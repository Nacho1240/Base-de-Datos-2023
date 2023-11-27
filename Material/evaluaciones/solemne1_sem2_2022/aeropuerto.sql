-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: aeropuerto | type: DATABASE --
-- DROP DATABASE IF EXISTS aeropuerto;
CREATE DATABASE aeropuerto;
-- ddl-end --


-- object: public.aeropuerto | type: TABLE --
-- DROP TABLE IF EXISTS public.aeropuerto CASCADE;
CREATE TABLE public.aeropuerto (
	id serial NOT NULL,
	nombre varchar(50),
	sigla varchar(10),
	ciudad varchar(50),
	region varchar(50),
	CONSTRAINT pk_aeropuerto PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.aeropuerto OWNER TO postgres;
-- ddl-end --

-- object: public.vuelo | type: TABLE --
-- DROP TABLE IF EXISTS public.vuelo CASCADE;
CREATE TABLE public.vuelo (
	numero integer NOT NULL,
	ciudad_origen varchar(50),
	ciudad_termino varchar(50),
	CONSTRAINT pk_vuelo PRIMARY KEY (numero)
);
-- ddl-end --
ALTER TABLE public.vuelo OWNER TO postgres;
-- ddl-end --

-- object: public.registro | type: TABLE --
-- DROP TABLE IF EXISTS public.registro CASCADE;
CREATE TABLE public.registro (
	id serial NOT NULL,
	vuelo_numero integer,
	fecha_despegue date,
	fecha_aterrizaje date,
	CONSTRAINT pk_registro PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.registro OWNER TO postgres;
-- ddl-end --

-- object: public.tripulacion | type: TABLE --
-- DROP TABLE IF EXISTS public.tripulacion CASCADE;
CREATE TABLE public.tripulacion (
	registro_id integer,
	empleado_id integer,
	cargo varchar(50),
	sueldo integer

);
-- ddl-end --
ALTER TABLE public.tripulacion OWNER TO postgres;
-- ddl-end --

-- object: public.empleados | type: TABLE --
-- DROP TABLE IF EXISTS public.empleados CASCADE;
CREATE TABLE public.empleados (
	id serial NOT NULL,
	nombre varchar(50),
	apellido varchar(50),
	rut varchar(10),
	CONSTRAINT pk_empleado PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.empleados OWNER TO postgres;
-- ddl-end --

-- object: fk_vuelo | type: CONSTRAINT --
-- ALTER TABLE public.registro DROP CONSTRAINT IF EXISTS fk_vuelo CASCADE;
ALTER TABLE public.registro ADD CONSTRAINT fk_vuelo FOREIGN KEY (vuelo_numero)
REFERENCES public.vuelo (numero) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_registro | type: CONSTRAINT --
-- ALTER TABLE public.tripulacion DROP CONSTRAINT IF EXISTS fk_registro CASCADE;
ALTER TABLE public.tripulacion ADD CONSTRAINT fk_registro FOREIGN KEY (registro_id)
REFERENCES public.registro (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_empleado | type: CONSTRAINT --
-- ALTER TABLE public.tripulacion DROP CONSTRAINT IF EXISTS fk_empleado CASCADE;
ALTER TABLE public.tripulacion ADD CONSTRAINT fk_empleado FOREIGN KEY (empleado_id)
REFERENCES public.empleados (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


