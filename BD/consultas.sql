select * from Actividad;
select * from Agendar_Cita;
select * from Consulta;
select * from Estudiante;
select * from Generar;
select * from  GenerarAutomatico;
select * from horarioclases;
select * from HorarioTrabajo;
select * from Persona;
select * from Profesores;
select * from Psicologo;
select * from sugerencia;
-- ID de cada tabla
select Id_Actividad from Actividad;
select Id_Cita from Agendar_Cita;
select Id_Consulta from Consulta;
select Id_estudiante from Estudiante;
select Id_Generar from Generar;
select Id_Generarautom from  GenerarAutomatico;
select idhorarioE from horarioclases;
select Id_Horario from HorarioTrabajo;
select ceduladeidentidad from Persona;
select Id_Profesor from Profesores;
select Id_Psicologo from Psicologo;
select Id_Sugerencia from sugerencia;
-- se mostrara las tabla que se cumpla los where
select * from Actividad where Dia=" jueves " and Nombre_Actividad=" universidad ";
select * from Agendar_Cita where  fecha > 2021-01-01 ;
select * from Consulta where Fecha_Emision > 2021-03-05; 
select * from Estudiante where Id_estudiante="O918379376" ;
select * from Generar where Id_Consulta= "LYS79YJY" or Id_Generar="94553" ;
select * from horarioclases where materiaregistrada= "Estadistica" or materiaregistrada="Quimica";
select * from HorarioTrabajo where MateriaImpartida = "EDO" ;
select * from Persona WHERE apellido = "Whitley" or apellido="Richards";
select * from Profesores where Id_Profesor="O981843711" or Id_Profesor = "O998858479";
select * from Psicologo where N_consultas<=5 ;
select Recomendacion from sugerencia where Id_Sugerencia="60496" ;
-- -	Mostrar un reporte con la fecha, id de la 
-- consulta y el nombre y apellido del usuario que desea agendar una cita.
select Fecha_Emision,Id_Consulta from Consulta AS C natural join Agendar_Cita AS Ag inner join Persona AS P ON Ag.cedulaIdentidad = P.ceduladeidentidad ;
-- -	Consultar cuantas citas existen en el sistema
-- count id_cita -> total_citas(agendar cita)
select count(Id_Cita) as numerocitas from Agendar_Cita;
-- -	Mostrar un reporte con nombre y cedula de identidad solo de aquellas personas que ejercen
--     la actividad de estudiante.
--      ΠNombre,cedula identidad.( σ tipo_actividad=’estudiante’  Persona⨝Estudiante)).
select nombre,ceduladeidentidad from  Estudiante AS E inner join Persona AS P ON E.Id_estudiante = P.ceduladeidentidad ;