/*crear un procedimiento que me permita listar todas citas de un estudiante en un rango
 de fechas. El procedimiento recibe la cédula y dos fechas. 
 El procedimiento retorna las citas que ese estudiante ha tenido o tiene en el rango de fechas establecido.*/
 
 
DELIMITER //
create procedure CitasEstudiante(In Iid_estudiante varchar(10),In fechainicio date, In fechafin date )
begin
select Fecha,Motivo,hora,Id_Cita,cedulaIdentidad,Id_Consulta from Agendar_Cita as AG inner join Persona as P
On AG.cedulaIdentidad = P.ceduladeidentidad inner join  Estudiante as E On E.Id_estudiante=P.ceduladeidentidad 
where cedulaIdentidad = Iid_estudiante and Fecha>fechainicio and Fecha < fechafin;
End //
DELIMITER ;

call citasEstudiante ("O918379376", "2021-01-01","2021-12-30");