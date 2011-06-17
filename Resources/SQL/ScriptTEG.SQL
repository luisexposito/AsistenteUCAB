/*
Created: 17/03/2009
Modified: 22/03/2009
Model: MS SQL Server 2008
Database: MS SQL Server 2008
*/

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

USE AsistenteUCAB 
GO 

-- Create tables section -------------------------------------------------

-- Table MATERIA

CREATE TABLE [MATERIA]
(
 [idMateria] Int IDENTITY(1,1),
 [nombre] VarChar(50) NOT NULL,
 [creditos] Int NOT NULL,
 [periodo] Int NOT NULL,
 [descripcion] VarChar(100) NULL,
 [horasTeoria] Int NULL,
 [horasPractica] Int NULL,
 [horasLab] Int NULL
)
go

-- Add keys for table MATERIA

ALTER TABLE [MATERIA] ADD CONSTRAINT [Key1] PRIMARY KEY CLUSTERED ([idMateria])
go

-- Table ALUMNO

CREATE TABLE [ALUMNO]
(
 [expediente] Int IDENTITY(1,1),
 [cedula] VarChar(10) NOT NULL,
 [username] VarChar(25) NOT NULL UNIQUE NONCLUSTERED,
 [nombre] VarChar(20) NOT NULL,
 [apellido] VarChar(20) NOT NULL,
 [sexo] VarChar(1) NOT NULL,
 [correoUcab] VarChar(50) NOT NULL,
 [correoAlternativo] VarChar(50) NULL,
 [idDireccion] Int NOT NULL,
 [creationDate] DateTime NOT NULL
)
go

-- Add keys for table ALUMNO

ALTER TABLE [ALUMNO] ADD CONSTRAINT [Key2] PRIMARY KEY ([expediente])
go

-- Table DIRECCION

CREATE TABLE [DIRECCION]
(
 [idDireccion] Int IDENTITY(1,1),
 [ciudad] Varchar(20) NOT NULL,
 [municipio] VarChar(20) NOT NULL,
 [localidad] VarChar(20) NOT NULL
 
)
go

-- Add keys for table DIRECCION

ALTER TABLE [DIRECCION] ADD CONSTRAINT [Key3] PRIMARY KEY ([idDireccion])
go

-- Table RECORDACADEMICO

CREATE TABLE [RECORDACADEMICO]
(
 [idRecord] Int IDENTITY(1,1),
 [idMateria] Int NOT NULL,
 [expediente] Int NOT NULL,
 [nota] Int NOT NULL,
 [periodoAcademico] VarChar(10) NOT NULL,
 [reparacion] VarChar(2) NOT NULL
)
go

-- Add keys for table RECORDACADEMICO

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [Key4] PRIMARY KEY CLUSTERED ([idRecord])
go

-- Table ACTIVIDAD

CREATE TABLE [ACTIVIDAD]
(
 [idActividad] Int IDENTITY(1,1),
 [nombre] VarChar(50) NOT NULL,
 [horaInicio] DateTime NOT NULL,
 [horaFin] DateTime NOT NULL,
 [expediente] Int NOT NULL,
 [idMateria] Int NULL,
 [seccion] VarChar(10) NULL,
 [periodo] VarChar(10) NULL
)
go

-- Add keys for table ACTIVIDAD

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [Key5] PRIMARY KEY CLUSTERED ([idActividad])
go

-- Table REQUISITO

CREATE TABLE [REQUISITO]
(
 [idMateriaPadre] Int NOT NULL,
 [idMateriaHijo] Int NOT NULL
)
go

-- Add keys for table REQUISITO

ALTER TABLE [REQUISITO] ADD CONSTRAINT [Key6] PRIMARY KEY ([idMateriaPadre],[idMateriaHijo])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [ALUMNO] ADD CONSTRAINT [DireccionAlumno] FOREIGN KEY ([idDireccion]) REFERENCES [DIRECCION] ([idDireccion])
go

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [MateriaRecord] FOREIGN KEY ([idMateria]) REFERENCES [MATERIA] ([idMateria])
go

ALTER TABLE [RECORDACADEMICO] ADD CONSTRAINT [AlumnoRecord] FOREIGN KEY ([expediente]) REFERENCES [ALUMNO] ([expediente])
go

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [MateriaActividad] FOREIGN KEY ([idMateria]) REFERENCES [MATERIA] ([idMateria])
go

ALTER TABLE [ACTIVIDAD] ADD CONSTRAINT [AlumnoActividad] FOREIGN KEY ([expediente]) REFERENCES [ALUMNO] ([expediente])
go

ALTER TABLE [REQUISITO] ADD CONSTRAINT [MateriaRequisitoPadre] FOREIGN KEY ([idMateriaPadre]) REFERENCES [MATERIA] ([idMateria])
go

ALTER TABLE [REQUISITO] ADD CONSTRAINT [MateriaRequisitoHijo] FOREIGN KEY ([idMateriaHijo]) REFERENCES [MATERIA] ([idMateria])
go




