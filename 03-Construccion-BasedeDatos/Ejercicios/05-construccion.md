CREATE DATABASE construccion;
GO

USE construccion;
GO

-- NO ACTION 

CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente
	PRIMARY KEY, 
	empresa	VARCHAR(20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE, 
	direccion VARCHAR(50), 
	tel VARCHAR(15) NOT NULL, 
	activo BIT NOT NULL, 
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (), 
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO 


CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1), 
	numero_telefono VARCHAR (15) NOT NULL, 
	created_at DATETIME2  NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(), 
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(), 
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id), 
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono), 
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION 
);
GO 

DROP TABLE telefono;


INSERT INTO cliente
VALUES (1, 'Patito de Hule', NULL, '773-def-123', 1, DEFAULT, DEFAULT );


INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES (2, 'Taqueria Mr. Linux', '7731234567', 1);


INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2347', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-3456', 1), 
       ('455-678-1234', 1), 
	   ('123-768-2345', 1), 
	   ('773-146-2476', 2);



-- Eliminar con ON DELETE EN NO ACTION 

-- eLIMINAN LOS HIJOS
DELETE FROM telefono
WHERE cliente_id = 1;

-- Elimina el padre
DELETE FROM cliente
WHERE cliente_id = 1;

SELECT * FROM cliente;
SELECT * FROM telefono;


-- Actualizar ON UPDATE en NO Action

-- Actualiza el hijo (poniendolo en nulo)
UPDATE telefono 
SET cliente_id = NULL
WHERE cliente_id = 2;

-- Actualiza el padre 
UPDATE cliente
SET cliente_id = 3
WHERE cliente_id = 2;

-- Actualiza el hijo con el nuevo id del padre
UPDATE telefono 
SET cliente_id = 3
WHERE cliente_id IS NULL;

SELECT * FROM cliente;
SELECT * FROM telefono;


-- Integridad Referencial ON DELETE Y ON UPDATE CASCADE

CREATE TABLE cliente (
	cliente_id INT
	CONSTRAINT pk_cliente
	PRIMARY KEY, 
	empresa	VARCHAR(20)
	CONSTRAINT uq_cliente_empresa
	UNIQUE, 
	direccion VARCHAR(50), 
	tel VARCHAR(15) NOT NULL, 
	activo BIT NOT NULL, 
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_cliente_created_at
	DEFAULT SYSDATETIME (), 
	updated_at DATETIME2 NOT NULL
	DEFAULT SYSDATETIME ()
);
GO 


CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1), 
	numero_telefono VARCHAR (15) NOT NULL, 
	created_at DATETIME2  NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(), 
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(), 
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id), 
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono), 
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE 
);
GO 

SELECT * FROM cliente;
SELECT * FROM telefono;


-- ELIMINAR EN ON DELETE CASCADE

-- Elminar al padre

DELETE FROM cliente
WHERE cliente_id = 1;

-- ACTUALIZAR EN ON UPDATE CASCADE
UPDATE cliente
SET cliente_id = 10
WHERE cliente_id = 1;


DROP TABLE telefono;

-- ON DELETE Y ON UPDATE SET NULL
CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1), 
	numero_telefono VARCHAR (15) NOT NULL, 
	created_at DATETIME2  NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(), 
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(), 
	cliente_id INT,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id), 
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono), 
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
);
GO 



INSERT INTO cliente (cliente_id,empresa,tel, activo)
VALUES (11,'Bimbo', '566788999', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2347', 11);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-3456', 11), 
       ('455-678-1234', 11), 
	   ('123-768-2345', 11), 
	   ('773-146-2476', 3);

DELETE FROM cliente 
WHERE cliente_id = 11;

UPDATE cliente
SET cliente_id = 15
WHERE cliente_id = 3;

SELECT * 
FROM cliente;

SELECT *
FROM telefono;

-- ON DELETE Y ON UPDATE SET NULL
DROP TABLE telefono;
GO

CREATE TABLE telefono (
	telefono_id INT IDENTITY (1,1), 
	numero_telefono VARCHAR (15) NOT NULL, 
	created_at DATETIME2  NOT NULL
	CONSTRAINT df_telefono_created_at
	DEFAULT SYSDATETIME(), 
	updated_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_updated_at
	DEFAULT SYSDATETIME(), 
	cliente_id INT
	CONSTRAINT df_telefono_cliente_id
	DEFAULT 0,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id), 
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono), 
	CONSTRAINT ck_telefono_numero_telefono
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente (cliente_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
);
GO 

INSERT INTO cliente (cliente_id,empresa,tel, activo)
VALUES (0,'mostrador', '66669147', 1);	

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2347', 10);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-3456', 10), 
       ('455-678-1234', 10), 
	   ('123-768-2345', 10), 
	   ('773-146-2476', 15);

DELETE FROM cliente
WHERE cliente_id = 10;

UPDATE cliente
SET cliente_id = 17
WHERE cliente_id = 15;

SELECT * 
FROM cliente;

SELECT *
FROM telefono;