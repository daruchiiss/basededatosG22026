-- CREAR UNA BASE DE DATOS PARA EMPRESA PATITO

-- CREAR LA BD

CREATE DATABASE empresa_patito;
GO

-- USAR LA BASE DE DATOS
USE empresa_patito;
GO

-- RESTRICCIÓN DE FOREIGN KEY 
CREATE TABLE proveedor (
	proveedor_id INT NOT NULL IDENTITY(1,1),
	empresa VARCHAR(35) NOT NULL, 
	direccion VARCHAR (80) NULL, 
	limite_credito DECIMAL (10,2) NOT NULL, 
	-- PRIMARY KEY
	CONSTRAINT pk_proveedor 
	PRIMARY KEY(proveedor_id),
	-- UNIQUE
	CONSTRAINT uq_proveedor_empresa
	UNIQUE (empresa),
	-- CHECK limite_credito
	CONSTRAINT ck_proveedor_limite_credito
	CHECK (limite_credito > 0.0 AND limite_credito <= 100000)
);
GO

CREATE TABLE producto (
	fabricante_id CHAR(3) NOT NULL, 
	producto_id INT NOT NULL,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre 
	UNIQUE, 
	stock INT NOT NULL
	CONSTRAINT ck_producto_stock
	CHECK (stock BETWEEN 1 AND 100), 
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1, 
	proveedor_id INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (fabricante_id, producto_id),
	CONSTRAINT fk_producto_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
);
GO

-- INTEGRIDADES REFERENCIALES ON DELETE Y ON UPDATE 
-- NO ACTION, CASCADE, SET NULL, SET DEFAULT

