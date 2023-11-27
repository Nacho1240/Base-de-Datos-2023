-- 1. Direcciones de los vacunatorios disponibles en la comuna de Providencia
SELECT  v.direccion from comunas c, vacunatorios v where v.comuna_id=c.id  and c.nombre = 'Providencia'; 

SELECT v.direccion from vacunatorios v  JOIN comunas c on v.comuna_id=c.id and c.nombre = 'Providencia' ;

-- 2. Cantidad de vacunatorio que se encuentran en fase 2
select count(*) from comunas c, vacunatorios v where v.comuna_id=c.id and fase=2;

select count(*) from comunas c  JOIN vacunatorios v on c.id=v.comuna_id and c.fase=2;

--3 Promedio de personas que se han vacunado en cada consultorio con almenos una dosis
SELECT avg (r1.numero_vacunados) from 
  (SELECT vacunatorio_id, count(*) numero_vacunados from inoculacion i group by vacunatorio_id) r1;

--4 nombre, telefono y email de las personas que fueron vacunadas con Moderna en la comuna de Las Condes

select p.nombre, p.telefono, p.email FROM personas p
 JOIN inoculacion i on p.rut = i.rut
 JOIN vacunas v on v.id = i.vacuna_id
 JOIN vacunatorios va on i.vacunatorio_id = va.id
 JOIN comunas c on va.comuna_id = c.id
   AND v.vacuna = 'Moderna'
   AND c.nombre = 'Las Condes';

-- 5. Nombre, telefono y email de las personas que fueron vacunadas con astrazeneca

select p.nombre, p.telefono, p.email FROM personas p
 JOIN inoculacion i on p.rut = i.rut
 JOIN vacunas v on v.id = i.vacuna_id
   AND v.vacuna = 'Astrazeneca'
;

--6 ¿cual es la vacuna que más se ha aplicado en Chile?

select v.vacuna from vacunas v
 JOIN (select vacuna_id, count(*) as cantidad from inoculacion i group by i.vacuna_id) conteo_vacunas
   ON v.id=conteo_vacunas.vacuna_id
 JOIN (select max(conteo_vacunas.cantidad) as max from (select vacuna_id, count(*) as cantidad from inoculacion i group by i.vacuna_id) conteo_vacunas ) v2
  ON conteo_vacunas.cantidad = v2.max; 
