-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.2
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public.clientes | type: TABLE --
-- DROP TABLE IF EXISTS public.clientes CASCADE;
CREATE TABLE public.clientes (
	rut varchar(9) NOT NULL,
	nombre varchar(50),
	comuna varchar(50),
	CONSTRAINT clientes_pk PRIMARY KEY (rut)
);
-- ddl-end --
ALTER TABLE public.clientes OWNER TO postgres;
-- ddl-end --

-- object: public.deptos | type: TABLE --
-- DROP TABLE IF EXISTS public.deptos CASCADE;
CREATE TABLE public.deptos (
	numdep numeric(2,0) NOT NULL,
	nombre varchar(14),
	ciudad varchar(13),
	CONSTRAINT deptos_pk PRIMARY KEY (numdep)
);
-- ddl-end --
ALTER TABLE public.deptos OWNER TO postgres;
-- ddl-end --

-- object: public.grados | type: TABLE --
-- DROP TABLE IF EXISTS public.grados CASCADE;
CREATE TABLE public.grados (
	grado numeric NOT NULL,
	sueldo_inf numeric,
	sueldo_sup numeric,
	CONSTRAINT grados_pk PRIMARY KEY (grado)
);
-- ddl-end --
ALTER TABLE public.grados OWNER TO postgres;
-- ddl-end --

-- object: public.producto | type: TABLE --
-- DROP TABLE IF EXISTS public.producto CASCADE;
CREATE TABLE public.producto (
	codigo integer NOT NULL,
	nombre varchar(50),
	precio integer,
	CONSTRAINT producto_pk PRIMARY KEY (codigo)
);
-- ddl-end --
ALTER TABLE public.producto OWNER TO postgres;
-- ddl-end --

-- object: public.venta | type: TABLE --
-- DROP TABLE IF EXISTS public.venta CASCADE;
CREATE TABLE public.venta (
	num_venta integer NOT NULL,
	monto integer,
	fecha date,
	rut_vende varchar(9),
	rut_cliente varchar(9),
	CONSTRAINT venta_pk PRIMARY KEY (num_venta)
);
-- ddl-end --
ALTER TABLE public.venta OWNER TO postgres;
-- ddl-end --

-- object: public.detalle_venta | type: TABLE --
-- DROP TABLE IF EXISTS public.detalle_venta CASCADE;
CREATE TABLE public.detalle_venta (
	num_venta integer,
	cod_producto integer,
	cantidad integer

);
-- ddl-end --
ALTER TABLE public.detalle_venta OWNER TO postgres;
-- ddl-end --

-- object: public.empleado | type: TABLE --
-- DROP TABLE IF EXISTS public.empleado CASCADE;
CREATE TABLE public.empleado (
	rut varchar(9) NOT NULL,
	nombre varchar(50),
	cargo varchar(9),
	rut_jefe varchar(9),
	fecha_ingreso date,
	sueldo numeric(7,2),
	comision numeric(7,2),
	numdep numeric(2),
	CONSTRAINT empleado_pk PRIMARY KEY (rut)
);
-- ddl-end --
ALTER TABLE public.empleado OWNER TO postgres;
-- ddl-end --

-- object: rut_cliente | type: CONSTRAINT --
-- ALTER TABLE public.venta DROP CONSTRAINT IF EXISTS rut_cliente CASCADE;
ALTER TABLE public.venta ADD CONSTRAINT rut_cliente FOREIGN KEY (rut_cliente)
REFERENCES public.clientes (rut) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: ru_vende | type: CONSTRAINT --
-- ALTER TABLE public.venta DROP CONSTRAINT IF EXISTS ru_vende CASCADE;
ALTER TABLE public.venta ADD CONSTRAINT ru_vende FOREIGN KEY (rut_vende)
REFERENCES public.empleado (rut) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: num_venta | type: CONSTRAINT --
-- ALTER TABLE public.detalle_venta DROP CONSTRAINT IF EXISTS num_venta CASCADE;
ALTER TABLE public.detalle_venta ADD CONSTRAINT num_venta FOREIGN KEY (num_venta)
REFERENCES public.venta (num_venta) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: cod_producto | type: CONSTRAINT --
-- ALTER TABLE public.detalle_venta DROP CONSTRAINT IF EXISTS cod_producto CASCADE;
ALTER TABLE public.detalle_venta ADD CONSTRAINT cod_producto FOREIGN KEY (cod_producto)
REFERENCES public.producto (codigo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: num_depto | type: CONSTRAINT --
-- ALTER TABLE public.empleado DROP CONSTRAINT IF EXISTS num_depto CASCADE;
ALTER TABLE public.empleado ADD CONSTRAINT num_depto FOREIGN KEY (numdep)
REFERENCES public.deptos (numdep) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: jefe | type: CONSTRAINT --
-- ALTER TABLE public.empleado DROP CONSTRAINT IF EXISTS jefe CASCADE;
ALTER TABLE public.empleado ADD CONSTRAINT jefe FOREIGN KEY (rut_jefe)
REFERENCES public.empleado (rut) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


