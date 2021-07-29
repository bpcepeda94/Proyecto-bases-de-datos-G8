
create table Persona (
	ceduladeidentidad varchar (10),
    nombre varchar(10),
    apellido varchar (10),
    correo_electronico varchar(20) not null,
    telefonocelular int(10) not null,
    telefonocasa int (10),
    fecha_nacimiento date ,
    primary key(ceduladeidentidad)
    );
    
Alter table Persona change correo_electronico correo_electronico varchar (40);
Alter table Persona change telefonocelular telefonocelular varchar (12);
Alter table Persona change telefonocasa telefonocasa varchar (12);
Alter table Persona change telefonocelular telefonocelular varchar (32);
Alter table Persona change telefonocasa telefonocasa varchar (32);
Alter table Persona change telefonocelular telefonocelular varchar (11);
Alter table Persona change telefonocasa telefonocasa varchar (11);
Alter table Persona change telefonocelular telefonocelular varchar (11);

create table horarioclases (
	materiaregistrada varchar(20),
    hora time,
    idestudiante varchar(10),
    idhorarioE varchar(20),
    PRIMARY KEY (idhorarioE),
	FOREIGN KEY (idestudiante) REFERENCES Estudiante (Id_estudiante)
    );
create table Estudiante 
(Id_estudiante varchar  (10),
MateriasRegistradas varchar (15),
HorarioClases varchar(15),
constraint fk_estudiante foreign key (Id_estudiante) references Persona (ceduladeidentidad),
constraint pk_estudiante primary key (Id_estudiante) 
);

create table Profesores 
(Id_Profesor varchar  (10),
MateriasImpartidas varchar (15),
HorarioTrabajo varchar(15),
constraint fk_profesores foreign key (Id_Profesor) references Persona (ceduladeidentidad),
constraint pk_profesores primary key (Id_Profesor) 
);


create table Psicologo 
(Id_Psicologo varchar  (10),
N_consultas int,
constraint fk_psicologo foreign key (Id_Psicologo) references Persona (ceduladeidentidad),
constraint pk_psicologo primary key (Id_Psicologo) 
);


drop table Actividad;

drop table GenerarAutomatico;

create table Actividad 
(Id_Actividad varchar  (10),
Tipo_Actividad varchar (20),
Dia varchar (10) ,
Nombre_Actividad varchar(15),
cedula_identidadProfe varchar (10),
cedula_identidadEstu varchar (10),
constraint fk_actividad foreign key (cedula_identidadProfe) references Profesores (Id_Profesor),
constraint fk_actividad2 foreign key (cedula_identidadEstu) references Estudiante (Id_estudiante),
constraint pk_actividad primary key (Id_Actividad) 
);
alter table Actividad change cedula_identidadProfe cedula_identidadProfe varchar (10) null;
alter table Actividad change cedula_identidadEstu cedula_identidadEstu varchar (10) null;
alter table Actividad drop constraint fk_actividad;
alter table Actividad drop constraint fk_actividad2;
alter table Actividad drop column cedula_identidadProfe;
alter table Actividad drop column cedula_identidadEstu;
alter table Actividad add cedula_identidad varchar (10);
alter table Actividad Add constraint fk_actividad foreign key (cedula_identidad) references Persona (ceduladeidentidad); 

create table sugerencia 
(Id_Sugerencia varchar  (10),
Recomendacion varchar (50),
Tipo_Sugerencia varchar (10),
constraint pk_sugerencia primary key (Id_Sugerencia) 
);

create table GenerarAutomatico 
(Id_Sugerencia varchar  (10),
Id_Actividad varchar (20),
Id_Generarautom varchar (10) ,
constraint fk_generarautom foreign key (Id_Sugerencia) references sugerencia (Id_Sugerencia),
constraint fk_generarautom2 foreign key (Id_Actividad) references Actividad (Id_Actividad),
constraint pk_generarautom primary key (Id_Generarautom) 
);



create table GenerarAutomatico 
(Id_Sugerencia varchar  (10),
Id_Actividad varchar (20),
Id_Generarautom varchar (10) ,
constraint fk_generarautom foreign key (Id_Sugerencia) references sugerencia (Id_Sugerencia),
constraint fk_generarautom2 foreign key (Id_Actividad) references Actividad (Id_Actividad),
constraint pk_generarautom primary key (Id_Generarautom) 
);


create table Consulta
(Id_Consulta varchar  (10),
Fecha_Emision date,
Fecha_Proxcita date,
constraint pk_Consulta primary key (Id_Consulta) 
);

create table Generar 
(Id_Consulta varchar (10),
Id_Sugerencia varchar  (10),
Id_Generar varchar (10) ,
constraint fk_generar foreign key (Id_Sugerencia) references sugerencia (Id_Sugerencia),
constraint fk_generar2 foreign key (Id_Consulta) references Consulta (Id_Consulta),
constraint pk_generar primary key (Id_Generar) 
);

create table Agendar_Cita 
(Fecha date,
Motivo varchar  (10),
hora time,
Id_Cita varchar (10),
cedulaIdentidad varchar (10),
Id_Consulta varchar (10),
constraint fk_agendarcita foreign key (cedulaIdentidad) references Persona (ceduladeidentidad),
constraint fk_agendarcita2 foreign key (Id_Consulta) references Consulta (Id_Consulta),
constraint pk_agendarcita primary key (Id_Cita) 
);

create table HorarioTrabajo
(Id_Profesor varchar(10),
Id_Horario varchar (10),
MateriaImpartida varchar (20),
HoraTrabajo time, 
constraint fk_horarioTrabajo foreign key (Id_Profesor) references Profesores (Id_Profesor),
constraint horarioTrabajo primary key (Id_Horario) 
);




