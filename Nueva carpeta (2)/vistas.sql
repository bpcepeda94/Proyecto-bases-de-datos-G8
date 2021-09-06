CREATE VIEW PersonaRegistradas
 AS SELECT nombre,apellido
 FROM Persona
 WHERE ceduladeidentidad='0981843711';

CREATE VIEW Actividadvista
 AS SELECT *
 FROM Actividad
 WHERE cedula_identidad='O918379376';
 
 CREATE VIEW horariodeestudiantes
 AS SELECT *
 FROM horarioclases
 WHERE idestudiante='O947919293' ;