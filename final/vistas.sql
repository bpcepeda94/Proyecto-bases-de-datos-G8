CREATE VIEW PersonaRegistradas
 AS SELECT nombre,apellido
 FROM Personas
 WHERE ceduladeidentidad=”0981843711”;

CREATE VIEW Actividad
 AS SELECT *
 FROM Actividad
 WHERE cedula_identidad=”098184843711”;
 
 CREATE VIEW horariodeestudiantes
 AS SELECT *
 FROM horarioclases
 WHERE cedula_identidad='O947919293' ;