/*PROCEDIMIENTOS ALMACENADOS TABLA PERSONA*/
-- INSERT
drop procedure if exists insertar_persona
delimiter //
create procedure insertar_persona (in ceduladeidentidad varchar (10) , in nombre varchar (10), in apellido varchar (10),
 in correo_electronico varchar (40), in telefonocelular varchar (11)  , in telefonocasa varchar (11), in fecha_nacimiento date)
 begin 
 insert into Persona  (ceduladeidentidad,nombre,apellido,correo_electronico,telefonocelular,telefonocasa,fecha_nacimiento)
 values (ceduladeidentidad,nombre,apellido,correo_electronico,telefonocelular,telefonocasa,fecha_nacimiento);
 end//
 delimiter ;
call insertar_persona ("1710173384", "patricio","cepeda","bpcepeda@espol.edu", "34234234","938844884","2000-11-01");

-- UPDATE
drop procedure if exists actualizar_persona;
delimiter //
create procedure actualizar_persona (in Uceduladeidentidad varchar (10) , in Unombre varchar (10), in Uapellido varchar (10),
 in Ucorreo_electronico varchar (40), in Utelefonocelular varchar (11)  , in Utelefonocasa varchar (11), in Ufecha_nacimiento date)
 begin 
 update
 Persona
 SET
 nombre=Unombre, apellido=Uapellido, correo_electronico = Ucorreo_electronico, telefonocelular=Utelefonocelular,
 telefonocasa=Utelefonocasa, fecha_nacimiento=Ufecha_nacimiento
 WHERE
 ceduladeidentidad=Uceduladeidentidad;
 end//
 delimiter ;
 call actualizar_persona ("1710173384","luis","sanchez","lucho@hotmail.com","0983160045","022164521","1972-06-01");
 
-- DELETE
drop procedure if exists eliminar_persona;
delimiter //
create procedure eliminar_persona (in Uceduladeidentidad varchar (10))
begin 
delete
from 
Persona
where 
ceduladeidentidad=Uceduladeidentidad;
end//
 delimiter ;
 call eliminar_persona ("1723481931");

 /*PROCEDIMIENTOS ALMACENADOS TABLA PSICOLOGO*/
-- INSERT
drop procedure if exists insertar_psicologo
delimiter //
create procedure insertar_psicologo (in Id_Psicologo varchar (10), in N_consultas int, in nombre varchar (10), in apellido varchar (10),
 in correo_electronico varchar (40), in telefonocelular varchar (11)  , in telefonocasa varchar (11), in fecha_nacimiento date  )
 begin
 if (SELECT Id_psicologo not IN (SELECT ceduladeidentidad FROM Persona)) then
 insert into Persona
 values (Id_Psicologo,nombre,apellido,correo_electronico,telefonocelular,telefonocasa,fecha_nacimiento);
 insert into Psicologo 
 values (Id_Psicologo,N_consultas); 
 end if; 
 end //
 delimiter ;
 call insertar_psicologo ("1723481931",50,"patricio", "cepeda","bpcepeda@espol.edu", "0996186711", "0221645423", "1999-04-19");
 
 
 -- AGREGAR CITA
 
 drop procedure if exists agregarcita;
delimiter //
create procedure agregarcita (in Fecha date, in motivo varchar (10), in hora time, in Id_Cita varchar (10),
 in cedulaIdentidad varchar (40), in Id_Consulta varchar (11) )
 begin
 if (SELECT Id_Consulta not IN (SELECT Id_Consulta FROM Consulta)) then
 insert into Agendar_Cita
 values (Fecha, motivo , hora , Id_Cita , cedulaIdentidad ,Id_Consulta);

 end if; 
 end //
 delimiter ;
 
 -- ELIMINAR CITA
 
 
 
 -- UPDATE
 drop procedure if exists actualizar_consultas;
delimiter //
create procedure actualizar_consultas (in UId_Psicologo varchar (10) , in UN_consultas int )
 begin 
 -- if (SELECT Id_Psicologo IN (SELECT ceduladeidentidad FROM Persona)) then
 update
 Psicologo
 SET
 N_consultas = UN_consultas
 WHERE
 Id_Psicologo = UId_Psicologo; 
 -- end if; 
 end//
 delimiter ;
 call actualizar_consultas ('1723481931', "64"); 
 
 -- delete CITA
 Drop procedure if exists eliminarCITA ;
delimiter //
create procedure eliminarCITA (in DID_CITA varchar (10))
begin 
delete
from
Agendar_Cita
where 
Id_Cita = DID_CITA ;
end
//
delimiter ;

	
Drop procedure if exists eliminar_psicologo ;
delimiter //
create procedure eliminar_psicologo (in DId_Psicologo varchar (10))
begin 
delete
from
Psicologo
where 
Id_Psicologo = DId_Psicologo ;
delete
from
Persona
where 
ceduladeidentidad = DId_Psicologo ;
end
//
delimiter ;

call eliminar_psicologo ("O921623939");





 /* ******PROCEDIMIENTOS ALMACENADOS TABLA ESTUDIANTE****** */
-- INSERT
drop procedure if exists insertar_estudianteNuevo
delimiter //
create procedure insertar_estudianteNuevo (in Id_estudiante varchar (10),in nombre varchar (10), in apellido varchar (10),
 in correo_electronico varchar (40), in telefonocelular varchar (11)  , in telefonocasa varchar (11), in fecha_nacimiento date,
 in materiaregistrada varchar (20), in hora time , in idhorarioE varchar (20))
 begin
 if (SELECT Id_estudiante not IN (SELECT ceduladeidentidad FROM Persona)) then
 insert into Persona 
 values (Id_estudiante,nombre,apellido,correo_electronico,telefonocelular,telefonocasa,fecha_nacimiento);
 insert into Estudiante 
 values (Id_estudiante);
 insert into horarioclases
 values (materiaregistrada,hora,id_estudiante,idhorarioE);
 end if; 
 end //
 delimiter ;
 call insertar_estudianteNuevo ("1710173384","Luis", "cepeda","luis@espol.edu", "0996181234", "0221645423", "1990-09-19", "DATABASE",
							"16:00:00", "252525" );
 
 --                       UPDATE
 drop procedure if exists actualizar_idEstudiante;
delimiter //
create procedure actualizar_idEstudiante (in UId_estudiante varchar (10), in Id_estudiante varchar (10))
 begin 
 update
 Persona
 SET
 ceduladeidentidad = UId_estudiante
 WHERE
 ceduladeidentidad = Id_estudiante;
 update
 Estudiante
 set
 Id_estudiante=UId_estudiante
 where
 Id_estudiante=Id_estudiante;
 update 
 horarioclases
 set
 idestudiante = UId_estudiante
 where 
 idestudiante = Id_estudiante;
 end//
 delimiter ;
 call actualizar_idEstudiante ('1723481931', "1710173384"); 
 
 /*
 -- UPDATE
 drop procedure if exists actualizar_horario;
delimiter //
create procedure actualizar_horario (in UId_estudiante varchar (10) , in uhora time, in umateria varchar (20))
 begin 
 update
 horarioclases
 SET
 materiaregistrada = umateria,
 hora =uhora
 WHERE
 idestudiante = UId_estudiante; 
 end//
 delimiter ;
 
 call actualizar_horario ('1710173384', "20:00:00", "YOGA"); 
 */
 -- delete
 
	
Drop procedure if exists eliminar_estudiante ;
delimiter //
create procedure eliminar_estudiante (in DId_estudiante varchar (10))
begin 
delete 
from horarioclases
where idestudiante = DId_estudiante;
delete
from
Estudiante
where 
Id_estudiante = DId_estudiante ;
delete
from
Persona
where 
ceduladeidentidad = DId_estudiante ;
end
//
delimiter ;


call eliminar_estudiante ("1710173384");
 
 /* ******PROCEDIMIENTOS ALMACENADOS TABLA PROFESOR- HORARIO****** */ 
 
 -- INSERT
drop procedure if exists insertar_profesor
delimiter //
create procedure insertar_profesor (in Id_Profesor varchar (10), in nombre varchar (10), in apellido varchar (10),  in correo_electronico varchar (40), in telefonocelular varchar (11)  , in telefonocasa varchar (11), in fecha_nacimiento date , Id_Horario varchar(10), MateriaImpartida Varchar(20), HoraTrabajo TIME )
 begin
 if (SELECT Id_profesor  not IN (SELECT ceduladeidentidad FROM Persona)) then
 insert into Persona
 values (Id_Profesor,nombre,apellido,correo_electronico,telefonocelular,telefonocasa,fecha_nacimiento);
 insert into Profesor 
 values (Id_Profesor); 
insert into HorarioTrabajo values(Id_Profesor,Id_Horario,MateriaImpartida,HoraTrabajo);
 end if; 
 end //
 delimiter ;
 
 
 -- UPDATE
 drop procedure if exists actualizar_ProfesorHorario;
delimiter //
create procedure actualizar_ProfesorHorario(in UId_Profesor varchar (10) , in UHoraTrabajo Time, in UMateriaImpartida varchar(20) )
 begin 
 update
 HorarioTrabajo
 SET
 MateriaImpartida=UMateriaImpartida,
HoraTrabajo=UHoraTrabajo
 WHERE
 Id_Profesor = UId_Profesor; 
end//
 delimiter ;
 
 
 -- delete
	
Drop procedure if exists eliminar_profesor ;
delimiter //
create procedure eliminar_profesor (in DId_Profesr  varchar (10))
begin 
delete
from HorarioTrabajo
where Id_Profesor = DId_Profesor;
delete
from
Profesor
where 
Id_Profesor = DId_Profesor ;
delete
from
Persona
where 
ceduladeidentidad = DId_Profesor ;
end
//
delimiter ;

-- ****** PROCEDIMIENTOS TABLA ACTIVIDAD ******
-- solo se puede agregar actividades a personas que ya estan registradas en la db
-- INSERT
drop procedure if exists agregar_actividad;
delimiter //
create procedure agregar_actividad (in Id_Actividad varchar (10) , in Tipo_Actividad varchar (20), in Dia varchar (10),
 in Nombre_Actividad varchar (15), in cedula_identidad varchar (10))
 begin 
 insert into Actividad (Id_Actividad,Tipo_Actividad,Dia,Nombre_Actividad,cedula_identidad )
 values (Id_Actividad,Tipo_Actividad,Dia,Nombre_Actividad,cedula_identidad);
 end//
 delimiter ;
 
 
 call agregar_actividad("xyzssd", "ocio", "lunes", "ver tv", "O972933339");
 
 
 -- UPDATE
 -- UPDATE
drop procedure if exists actualizar_actividad;
delimiter //
create procedure actualizar_actividad (in uId_Actividad varchar (10) , in uTipo_Actividad varchar (20), in uDia varchar (10),
 in uNombre_Actividad varchar (15))
 begin 
 update
 Actividad
 SET
 Tipo_Actividad=uTipo_Actividad, Dia=uDia, Nombre_Actividad=uNombre_Actividad
 WHERE
 Id_Actividad = uId_Actividad;
 end//
 delimiter ;
 
 
 call actualizar_actividad("DNZ77XHF5", "ocio", "viernes", "jugar");
 
 -- DELETE
 
-- DELETE
drop procedure if exists eliminar_actividad;
delimiter //
create procedure eliminar_actividad (in UId_Actividad varchar (10))
begin 
delete
from 
Actividad
where 
Id_Actividad=UId_Actividad;
end//
 delimiter ;
 call eliminar_actividad ("DNZ77XHF5");
 
-- ****** PROCEDIMIENTOS TABLA SUGERENCIA ****** 

-- INSERT
drop procedure if exists agregar_sugerencia;
delimiter //
create procedure agregar_sugerencia (in Id_Sugerencia varchar (10) , in Recomendacion varchar (50), in Tipo_Sugerencia varchar (10))
 begin 
 insert into sugerencia (Id_Sugerencia,Recomendacion,Tipo_Sugerencia)
 values (Id_Sugerencia,Recomendacion,Tipo_Sugerencia);
 end//
 delimiter ;
 
 call agregar_sugerencia ("12345uut", "no estudie en espol", "vida");
 
 -- UPDATE 
 drop procedure if exists actualizar_sugerencia;
delimiter //
create procedure actualizar_sugerencia (in uId_Sugerencia varchar (10) , in uRecomendacion varchar (50), in uTipo_Sugerencia varchar (10))
 begin 
 update
 sugerencia
 SET
 Recomendacion=uRecomendacion, Tipo_Sugerencia=uTipo_Sugerencia
 WHERE
 Id_Sugerencia=uId_Sugerencia;
 end//
 delimiter ;
 
 call actualizar_sugerencia ("12345uut", "cambio sugerencia", "politenico");
 
 -- DELETE
drop procedure if exists eliminar_sugerencia;
delimiter //
create procedure eliminar_sugerencia (in dId_Sugerencia varchar (10))
begin 
delete
from 
sugerencia
where 
Id_Sugerencia=dId_Sugerencia;
end//
 delimiter ; 
 
 call eliminar_sugerencia ("12345uut");
 
 

DELIMITER //
 
CREATE PROCEDURE Vista_Personasregistradas()
BEGIN
SELECT * FROM PersonaRegistradas;
END//
 
DELIMITER ;



 DELIMITER //
 
CREATE PROCEDURE Vista_Actividad()
BEGIN
SELECT * FROM Actividadvista;
END//
 
DELIMITER ;
 
 
 

DELIMITER //
 
CREATE PROCEDURE Vista_horarioestudiantes()
BEGIN
SELECT * FROM horariodeestudiantes;
END//
 
DELIMITER ;
 