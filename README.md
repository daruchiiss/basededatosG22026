# 📊 Curso de Bases de Datos: De los Fundamentos al Lenguaje SQL

[![Estado](https://img.shields.io/badge/estado-en%20progreso-yellow)]()
[![Lenguaje](https://img.shields.io/badge/SQL-estándar-blue)]()
[![Licencia](https://img.shields.io/badge/licencia-MIT-green)]()

Repositorio oficial de la materia **Bases de Datos**. Aquí se documentan y organizan los conocimientos teóricos y prácticos desarrollados a lo largo del curso: desde la abstracción conceptual de la información hasta el diseño e implementación de bases de datos relacionales robustas mediante SQL.

---

##  Tabla de Contenidos

1. [Objetivo del Curso](#-objetivo-del-curso)
2. [Mapa de Ruta del Aprendizaje](#-mapa-de-ruta-del-aprendizaje)
3. [Contenido del Curso](#-contenido-del-curso)
4. [Estructura del Repositorio](#-estructura-del-repositorio)
5. [Tecnologías Sugeridas](#-tecnologías-sugeridas)
6. [Requisitos Previos](#-requisitos-previos)
7. [Autor](#-Darany)

---

##  Objetivo del Curso

Brindar al estudiante las bases conceptuales y técnicas necesarias para **modelar, diseñar, implementar y consultar** bases de datos relacionales, partiendo del análisis de requerimientos hasta la escritura de sentencias SQL para definición y manipulación de datos.

---

##  Mapa de Ruta del Aprendizaje

| Etapa | Tema | Enfoque |
|:---:|---|---|
| 1️⃣ | Fundamentos | Conceptos base de datos vs. información |
| 2️⃣ | Modelo Entidad-Relación | Diseño conceptual |
| 3️⃣ | Modelo Relacional | Diseño lógico |
| 4️⃣ | SQL – LDD | Implementación física del esquema |
| 5️⃣ | SQL – LMD | Consulta y manipulación de datos |

```
Fundamentos → Modelo E-R → Modelo Relacional → SQL (LDD) → SQL (LMD)
```

---

##  Contenido del Curso

### 1.  Fundamentos de Bases de Datos

Introducción a los conceptos clave para entender cómo y por qué almacenamos datos de forma estructurada.

- Diferencia entre datos e información; evolución de los archivos tradicionales a las bases de datos.
- Arquitectura ANSI-SPARC (tres niveles): componentes y objetivos de un SGBD.
- Distinción entre los niveles físico, conceptual y de visión (externo).

### 2.  Modelado de Datos: Modelo Entidad-Relación (E-R)

Fase de diseño conceptual en la que se transforman los requerimientos del mundo real en diagramas estructurados.

- Entidades fuertes y débiles; atributos clave, compuestos, multivaluados y derivados.
- Cardinalidad y participación (1:1, 1:N, N:M).
- Elaboración de diagramas conceptuales claros para representar la lógica del negocio.

### 3.  El Modelo Relacional

Transición del modelo conceptual (E-R) al modelo lógico, apto para su implementación en sistemas modernos.

- Tablas, tuplas (filas), atributos (columnas) y dominios.
- Identificación de claves primarias (PK) y claves foráneas (FK).
- Proceso de mapeo de entidades y relaciones hacia tablas físicas.
- Restricciones y acciones en cascada (`ON DELETE` / `ON UPDATE`).

### 4.  Construcción con SQL – LDD (Lenguaje de Definición de Datos)

Implementación física de la estructura de la base de datos utilizando SQL estándar.

- Sentencias: `CREATE`, `ALTER` y `DROP`.
- Restricciones: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.

```sql
-- Ejemplo de creación de tablas (LDD)
CREATE TABLE alumnos (
    alumno_id          INT           PRIMARY KEY,
    matricula          VARCHAR(15)   UNIQUE NOT NULL,
    nombre             VARCHAR(50)   NOT NULL,
    fecha_nacimiento   DATE,
    estado             VARCHAR(10)   DEFAULT 'Activo'
);

CREATE TABLE inscripciones (
    inscripcion_id   INT        PRIMARY KEY,
    alumno_id        INT,
    fecha_registro   TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id) ON DELETE CASCADE
);
```

### 5.  Manipulación con SQL – LMD (Lenguaje de Manipulación de Datos)

Interacción directa con los datos almacenados para su consulta y modificación.

- Sentencias: `INSERT`, `SELECT`, `UPDATE` y `DELETE`.
- Cláusulas: `WHERE`, `ORDER BY`, `GROUP BY` y `HAVING`.
- Combinación de tablas mediante `INNER JOIN`, `LEFT JOIN` y `RIGHT JOIN`.

```sql
-- Ejemplo de consulta multitabla (LMD)
SELECT
    a.nombre,
    i.fecha_registro
FROM alumnos a
INNER JOIN inscripciones i ON a.alumno_id = i.alumno_id
WHERE a.estado = 'Activo'
ORDER BY i.fecha_registro DESC;
```

---

##  Estructura del Repositorio

```
├── 01_fundamentos/        # Apuntes teóricos
├── 02_modelo_er/          # Diagramas y casos de estudio
├── 03_modelo_relacional/  # Ejercicios de mapeo
├── 04_sql_ldd/            # Scripts de creación de esquemas (.sql)
├── 05_sql_lmd/            # Scripts de consultas y manipulación (.sql)
└── README.md              # Presentación del curso
```

---

##  Tecnologías Sugeridas

| Categoría | Herramientas |
|---|---|
| Modelado / Diagramas | [Draw.io](https://app.diagrams.net/), [Lucidchart](https://www.lucidchart.com/) |
| Motores de Base de Datos | MySQL, PostgreSQL, SQL Server |
| Clientes / IDEs | DBeaver, Azure Data Studio, MySQL Workbench |

---

##  Requisitos Previos

- Conocimientos básicos de lógica y estructuras de datos.
- Un motor de base de datos instalado (MySQL, PostgreSQL o SQL Server).
- Un cliente SQL de tu preferencia (DBeaver, Workbench, etc.).

---

## Autor

**Darany**
 daranyramirez1911@gmail.com
 Universidad Tecnologica Tula Tepji

---

## 📄 Licencia

Este proyecto se comparte con fines educativos. Puedes usar y adaptar el contenido citando la fuente original.