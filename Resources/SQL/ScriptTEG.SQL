USE MASTER 
GO 

-- Create Database section -------------------------------------------------

IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'AsistenteUCAB') 
BEGIN 
	DROP DATABASE AsistenteUCAB
END 
	CREATE DATABASE AsistenteUCAB 
GO 

PRINT 'La base de datos: AsistenteUCAB ha sido creada con exito. Gracias, APLE Team.' 
GO 
GO 

USE AsistenteUCAB 
GO 
-- Create tables section -------------------------------------------------

-- Table DefaultSchema.MATERIA

CREATE TABLE [MATERIA]
(
 [idMateria] Int IDENTITY(1,1) NOT NULL,
 [nombre] Varchar(50) NOT NULL,
 [creditos] Int NOT NULL,
 [periodo] Int NOT NULL,
 [descripcion] Varchar(100) NULL,
 [horasTeoria] Int NULL,
 [horasPractica] Int NULL,
 [horasLab] Int NULL
)
go

-- Add keys for table DefaultSchema.MATERIA

ALTER TABLE [MATERIA] ADD CONSTRAINT [Key1] PRIMARY KEY CLUSTERED ([idMateria])
go

-- Table DefaultSchema.ALUMNO

CREATE TABLE [ALUMNO]
(
 [expediente] Int NOT NULL,
 [cedula] Varchar(10) NOT NULL,
 [username] Varchar(25) NOT NULL,
 [nombre] Varchar(20) NOT NULL,
 [apellido] Varchar(20) NOT NULL,
 [sexo] Varchar(1) NOT NULL,
 [correoUcab] Varchar(50) NOT NULL,
 [creationDate] Datetime NOT NULL,
 [correoAlternativo] Varchar(50) NULL,
 [idDireccion] Int NOT NULL
)
go

-- Add keys for table DefaultSchema.ALUMNO

ALTER TABLE [ALUMNO] ADD CONSTRAINT [Key2] PRIMARY KEY ([expediente])
go

ALTER TABLE [ALUMNO] ADD CONSTRAINT [uq_ALUMNO_username] UNIQUE ([username])
go

-- Table DefaultSchema.DIRECCION

CREATE TABLE [DIRECCION]
(
 [idDireccion] Int IDENTITY(1,1) NOT NULL,
 [ciudad] Varchar(20) NOT NULL,
 [municipio] Varchar(20) NOT NULL,
 [localidad] Varchar(20) NOT NULL
)
go

-- Add keys for table DefaultSchema.DIRECCION

ALTER TABLE [DIRECCION] ADD CONSTRAINT [Key3] PRIMARY KEY CLUSTERED ([idDireccion])
go

-- Table DefaultSchema.RECORDACADEMICO

CREATE TABLE [RECORDACADEMICO]
(
 [idRecord] Int IDENTITY(1,1) NOT NULL,
 [idMateria] Int NOT NULL,
 [expediente] Int NOT NULL,
 [nota] Int NOT NULL,
 [periodoAcademico] Varchar(10) NOT NULL,
 [reparacion] Varchar(2) NOT NULL
)
go

-- Add keys for table DefaultSchema.RECORDACADEMICO

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [Key4] PRIMARY KEY  CLUSTERED ([idRecord])
go

-- Table DefaultSchema.ACTIVIDAD

CREATE TABLE [ACTIVIDAD]
(
 [idActividad] Int IDENTITY(1,1) NOT NULL,
 [nombre] Varchar(50) NOT NULL,
 [horaInicio] Datetime NOT NULL,
 [horaFin] Datetime NOT NULL,
 [seccion] Varchar(10) NULL,
 [periodo] Varchar(10) NULL,
 [expediente] Int NULL,
 [idMateria] Int NULL
)
go

-- Add keys for table DefaultSchema.ACTIVIDAD

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [Key5] PRIMARY KEY  CLUSTERED ([idActividad])
go

-- Table DefaultSchema.REQUISITO

CREATE TABLE [REQUISITO]
(
 [idMateriaPadre] Int NOT NULL,
 [idMateriaHijo] Int NOT NULL
)
go

-- Add keys for table DefaultSchema.REQUISITO

ALTER TABLE [REQUISITO] ADD CONSTRAINT [Key6] PRIMARY KEY ([idMateriaPadre],[idMateriaHijo])
go

-- Table CRONOGRAMA

CREATE TABLE [CRONOGRAMA]
(
 [expediente] Int NOT NULL,
 [idActividad] Int NOT NULL
)
go

-- Add keys for table CRONOGRAMA

ALTER TABLE [CRONOGRAMA] ADD CONSTRAINT [Key7] PRIMARY KEY ([expediente],[idActividad])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [ALUMNO] ADD CONSTRAINT [DireccionAlumno] FOREIGN KEY ([idDireccion]) REFERENCES [DIRECCION] ([idDireccion]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [MateriaRecord] FOREIGN KEY ([idMateria]) REFERENCES [MATERIA] ([idMateria]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [AlumnoRecord] FOREIGN KEY ([expediente]) REFERENCES [ALUMNO] ([expediente]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [MateriaActividad] FOREIGN KEY ([idMateria]) REFERENCES [MATERIA] ([idMateria]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [REQUISITO] ADD CONSTRAINT [MateriaRequisitoPadre] FOREIGN KEY ([idMateriaPadre]) REFERENCES [MATERIA] ([idMateria]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [REQUISITO] ADD CONSTRAINT [MateriaRequisitoHijo] FOREIGN KEY ([idMateriaHijo]) REFERENCES [MATERIA] ([idMateria]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [CRONOGRAMA] ADD CONSTRAINT [AlumnoCronograma] FOREIGN KEY ([expediente]) REFERENCES [ALUMNO] ([expediente])
go

ALTER TABLE [CRONOGRAMA] ADD CONSTRAINT [ActividadCronograma] FOREIGN KEY ([idActividad]) REFERENCES [ACTIVIDAD] ([idActividad])
go

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [AlumnoActividad] FOREIGN KEY ([expediente]) REFERENCES [ALUMNO] ([expediente])
go








