CREATE DATABASE universidad;
GO
USE universidad;
GO
CREATE TABLE alumno (
 alumno_id INT, 
 nombre VARCHAR (100), 
 edad INT
);
GO

CREATE TABLE alumno_2(
	alumno_id INT, 
	nombre VARCHAR (100), 
	apellido_paterno VARCHAR(50), 
	apellido_materno VARCHAR (50), 
	fecha_nacimiento DATE, 
	correo VARCHAR (45) 
);
GO
CREATE TABLE alumno_3 (
	alumno_id INT PRIMARY KEY, 
	nombre VARCHAR(100), 
	correo VARCHAR(40)
);
GO

CREATE TABLE alumno_4 (
	alumno_id INT NOT NULL, 
	nombre VARCHAR(100), 
	correo VARCHAR(40),
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);
GO

INSERT INTO alumno_4
VALUES (1, 'Panfilo', 'correo@correo.com');

INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com');

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1, 1),
	nombre VARCHAR(50) NOT NULL,
	edad INT NULL, 
	CONSTRAINT pk_profesor 
	PRIMARY KEY ( profesor_id )
);
GO

INSERT INTO profesor
VALUES ('German', 29), 
       ('Maricha', 22);

SELECT * 
FROM profesor;

CREATE TABLE materia(
	materia_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	correo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE materia_2(
	materia_id INT NOT NULL IDENTITY(1,1), 
	correo VARCHAR(50) NOT NULL, 
	CONSTRAINT pk_materia_2
	PRIMARY KEY (materia_id), 
	CONSTRAINT uq_materia_2_correo
	UNIQUE (correo)
);
GO

INSERT INTO materia_2
VALUES ('correo@correo.com');

INSERT INTO materia_2
VALUES('correo2@correo.com');

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1) PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL UNIQUE, 
	activo BIT DEFAULT 1
);
GO

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1) 
	CONSTRAINT pk_categoria
	PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	UNIQUE, 
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1
);
GO

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY (1,1), 
	nombre VARCHAR(30) NOT NULL,
	activo BIT 
	CONSTRAINT df_categoria_activo
	DEFAULT 1, 
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id), 
	CONSTRAINT uq_categoria_nombre
	UNIQUE (nombre)
);
GO

DROP TABLE categoria;

INSERT INTO categoria
VALUES ('Carnes Frias', 1);

INSERT INTO categoria
VALUES ('Carnes Calientes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES ('Chochos');

CREATE TABLE producto (
   producto_id INT IDENTITY(1,1) PRIMARY KEY, 
   nombre VARCHAR(20) NOT NULL UNIQUE,
   precio DECIMAL (10, 2) NOT NULL CHECK (precio>0), 
   existencia INT NOT NULL CHECK (existencia > 0  AND existencia<=100), 
   activo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE producto (
   producto_id INT IDENTITY(1,1) 
   CONSTRAINT pk_producto
   PRIMARY KEY, 
   nombre VARCHAR(20) NOT NULL 
   CONSTRAINT uq_producto_nombre
   UNIQUE,
   precio DECIMAL (10, 2) NOT NULL 
   CONSTRAINT ck_producto_precio
   CHECK (precio>0), 
   existencia INT NOT NULL 
   CONSTRAINT ck_producto_existencia
   CHECK (existencia > 0  AND existencia<=100), 
   activo BIT NOT NULL 
   CONSTRAINT df_producto_activo
   DEFAULT 1
);
GO

CREATE TABLE producto (
	producto_id INT NOT NULL, 
	nombre VARCHAR (20) NOT NULL, 
	descripcion VARCHAR(80), 
	precio DECIMAL(10, 2) NOT NULL, 
	existencia INT NOT NULL, 
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1, 
	-- Restricción PK
	CONSTRAINT pk_producto
	PRIMARY KEY(producto_id), 
	-- Restricción UNIQUE
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	-- Restricción check precio
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	-- Restricción check existencia
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100)
);
GO


DROP TABLE producto;
GO


INSERT INTO producto
VALUES (1, 'Pitufo',NULL ,200, 99, 0);

INSERT INTO producto
VALUES (2, 'Quemadita',NULL ,200, 100, DEFAULT);

INSERT INTO producto (producto_id, nombre, existencia, precio)
VALUES (3,'Pantera Rosa', 47, 80);


SELECT *
FROM producto;
