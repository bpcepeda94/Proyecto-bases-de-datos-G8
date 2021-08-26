DELIMITER $$
CREATE TRIGGER trigger_Horario AFTER INSERT ON HorarioTrabajo
FOR EACH ROW
BEGIN
insert into HorarioTrabajo values(Id_Profesor,cedulaidentidad,Id_Horario,MateriaImpartida,HoraTrabajo);
END; $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `nuevasuge` BEFORE INSERT ON `sugerencia`
FOR EACH ROW 
BEGIN
  SET NEW.Recomendacion = CONCAT(NEW.Recomendacion, ' (Nueva)');
END $$
DELIMITER ;

start transaction;
 call agregar_sugerencia ("12345uut", "no estudie en espol", "vida");
rollback;
commit;


DROP TRIGGER IF EXISTS BEFORE_INSERT_Cita;
DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_Cita  BEFORE INSERT ON Agendar_Cita FOR EACH ROW
BEGIN

IF NOT ( hora between '09:00:00' AND '19:00:00') THEN

SET new.Id_Cita = NULL; -- Impider la operación.

END IF;
END $$ DELIMITER ;

start transaction;
call agregarcita ("2020-05-20", "tristeza", "20:00:00",'215asdf','09995154','BXS64IDR');
rollback;
commit;

call eliminarCITA('215asdf');
