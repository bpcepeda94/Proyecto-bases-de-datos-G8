DELIMITER $$
CREATE TRIGGER trigger_Horario AFTER INSERT ON HorarioTrabajo
FOR EACH ROW
BEGIN
insert into HorarioTrabajo values(Id_Profesor,cedulaidentidad,Id_Horario,MateriaImpartida,HoraTrabajo);
END; $$