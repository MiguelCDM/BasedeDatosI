create database proyecto
use  proyecto
create table usuarios(
	usuario_id integer IDENTITY(1,1) primary key,
	nombre varchar(30),
	paterno varchar(30),
	materno varchar(30),
	ci varchar(30),
	email varchar(50),
	password varchar(50)
);

create table docentes(
	docente_id integer IDENTITY(1,1) primary key,
	nombre varchar(30),
	paterno varchar(30),
	materno varchar(30),
	ci varchar(30),
	email varchar(50),
	password varchar(50)
);

create table estudiantes(
	estudiante_id integer IDENTITY(1,1) primary key,
	nombre varchar(30),
	paterno varchar(30),
	materno varchar(30),
	ci varchar(30),
	direccion varchar(100),
	celular varchar(20),
	tutor varchar(100)
);

create table materias(
	materia_id integer IDENTITY(1,1) primary key,
	nombre varchar(30),
);

create table est_asignacion(
	est_asignacion_id integer IDENTITY(1,1) primary key,
	estudiante_id integer,
	materia_id integer,
	docente_id integer,
	foreign key (estudiante_id) references estudiantes(estudiante_id),
	foreign key (materia_id) references materias(materia_id),
	foreign key (docente_id) references docentes(docente_id)
);

create table doc_asignacion(
	doc_asignacion_id integer IDENTITY(1,1) primary key,
	docente_id integer,
	materia_id integer,
	foreign key (docente_id) references docentes(docente_id),
	foreign key (materia_id) references materias(materia_id)
);

create table notas(
	nota integer IDENTITY(1,1) primary key,
	estudiante_id integer null,
	doc_asignacion_id integer null,
	primer integer null,
	segundo integer null,
	tercer integer null,
	promedio integer default 0,
	foreign key (estudiante_id) references estudiantes(estudiante_id),
	foreign key (doc_asignacion_id) references doc_asignacion(doc_asignacion_id)
);