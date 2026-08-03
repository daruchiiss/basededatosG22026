#  Diccionario de Datos — Ejercicios de Modelado E-R
#### Autor (Darany Ramirez)

---

## Ejercicio 1 — Paciente / Expediente Médico

### Entidad: `PACIENTE`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| id_paciente | INT | Identificador único del paciente | PK |
| nombre | VARCHAR(100) | Nombre completo del paciente | NOT NULL |
| fecha_nacimiento | DATE | Fecha de nacimiento del paciente | NOT NULL |
| tipo_sangre | VARCHAR(3) | Tipo de sangre (ej. O+, A-, AB+) | NOT NULL |

### Entidad: `EXPEDIENTE_MEDICO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| id_expediente | INT | Identificador único del expediente  | PK |
| id_paciente | INT | Paciente dueño del expediente | FK → PACIENTE, UNIQUE, NOT NULL |
| fecha_apertura | DATE | Fecha de creación del expediente | NOT NULL |

### Relación: `TIENE`

| Entidad 1 | Cardinalidad | Entidad 2 | Participación |
|---|:---:|---|---|
| PACIENTE | 1:1 | EXPEDIENTE_MEDICO | Total en ambas entidades (cada paciente debe tener exactamente un expediente) |

---

## Ejercicio 2 — Universidad (Profesor / Curso)

### Entidad: `PROFESOR`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| id_profesor | INT | Identificador único del profesor | PK |
| nombre | VARCHAR(100) | Nombre completo del profesor | NOT NULL |
| especialidad | VARCHAR(60) | Área de especialidad del profesor | NOT NULL |

### Entidad: `CURSO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| id_curso | INT | Identificador único del curso | PK |
| nombre_curso | VARCHAR(100) | Nombre del curso | NOT NULL |
| creditos | INT | Créditos de la materia | NOT NULL |
| id_profesor | INT | Profesor que imparte el curso | FK → PROFESOR, NOT NULL |

### Relación: `IMPARTE`

| Entidad 1 | Cardinalidad | Entidad 2 | Participación |
|---|:---:|---|---|
| PROFESOR | 1:N | CURSO | Parcial en PROFESOR (puede haber profesores sin cursos) · Total en CURSO (todo curso debe tener profesor asignado) |

---

## Ejercicio 3 — Escuela (Alumno / Materia)

### Entidad: `ALUMNO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| matricula | VARCHAR(15) | Identificador único del alumno | PK |
| nombre | VARCHAR(100) | Nombre completo del alumno | NOT NULL |
| semestre | INT | Semestre que cursa actualmente | NOT NULL |

### Entidad: `MATERIA`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| clave_materia | VARCHAR(10) | Identificador único de la materia | PK |
| nombre_materia | VARCHAR(100) | Nombre de la materia | NOT NULL |
| creditos | INT | Créditos de la materia | NOT NULL |

### Relación asociativa: `INSCRIBE`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| matricula | VARCHAR(15) | Alumno inscrito | FK → ALUMNO |
| clave_materia | VARCHAR(10) | Materia en la que se inscribe | FK → MATERIA |
| fecha_inscripcion | DATE | Fecha en que se realizó la inscripción | NOT NULL |
| calificacion_final | DECIMAL(4,2) | Calificación final obtenida | NULL (se llena al concluir el curso) |

*(matricula, clave_materia) forman la clave primaria compuesta de `INSCRIBE`.*

| Entidad 1 | Cardinalidad | Entidad 2 | Participación |
|---|:---:|---|---|
| ALUMNO | N:M | MATERIA | Total en ALUMNO (todo alumno debe estar inscrito en al menos una materia) · Parcial en MATERIA (puede haber materias sin alumnos) |

---

## Ejercicio 4 — Empresa de Ventas al por Mayor

### Entidad: `CLIENTE`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_cliente | INT | Identificador único del cliente | PK |
| nombre | VARCHAR(150) | Razón social del cliente (persona moral) | NOT NULL |

### Entidad: `PEDIDO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_pedido | INT | Identificador único del pedido | PK |
| numero_cliente | INT | Cliente que realizó el pedido | FK → CLIENTE, NOT NULL |
| fecha_pedido | DATE | Fecha en que se generó el pedido  | NOT NULL |

### Entidad: `PRODUCTO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_producto | INT | Identificador único del producto | PK |
| nombre | VARCHAR(100) | Nombre del producto | NOT NULL |
| precio | DECIMAL(10,2) | Precio unitario del producto | NOT NULL |

### Relación asociativa: `DETALLE_PEDIDO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_pedido | INT | Pedido al que pertenece el detalle | FK → PEDIDO |
| numero_producto | INT | Producto incluido en el pedido | FK → PRODUCTO |
| cantidad | INT | Cantidad vendida de ese producto | NOT NULL |
| precio_venta | DECIMAL(10,2) | Precio al que se vendió (puede diferir del precio de lista) | NOT NULL |

*(numero_pedido, numero_producto) forman la clave primaria compuesta de `DETALLE_PEDIDO`.*

| Relación | Cardinalidad | Participación |
|---|:---:|---|
| CLIENTE — PEDIDO | 1:N | Total en PEDIDO (todo pedido pertenece a un cliente) |
| PEDIDO — PRODUCTO (vía DETALLE_PEDIDO) | N:M | Total en PEDIDO (debe contener ≥1 producto) · Parcial en PRODUCTO (puede no haberse vendido) |

## Ejercicio 5 — Empresa (Departamentos, Proyectos, Empleados y Dependientes)

### Entidad: `DEPARTAMENTO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_departamento | INT | Identificador único del departamento | PK |
| nombre_departamento | VARCHAR(50) | Nombre del departamento | UNIQUE, NOT NULL |
| ssn_gerente | VARCHAR(11) | Empleado que gerencia el departamento | FK → EMPLEADO, NOT NULL |
| fecha_inicio_gerente | DATE | Fecha en que el gerente comenzó a administrar el departamento | NOT NULL |

### Entidad débil: `UBICACION_DEPARTAMENTO`

> Representa el atributo multivaluado *"una o más ubicaciones por departamento"*.

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_departamento | INT | Departamento al que pertenece la ubicación | FK → DEPARTAMENTO |
| ubicacion | VARCHAR(60) | Ubicación física del departamento | NOT NULL |

*(numero_departamento, ubicacion) forman la clave primaria compuesta.*

### Entidad: `PROYECTO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| numero_proyecto | INT | Identificador único del proyecto | PK |
| nombre_proyecto | VARCHAR(50) | Nombre del proyecto | UNIQUE, NOT NULL |
| ubicacion | VARCHAR(60) | Ubicación única del proyecto | NOT NULL |
| numero_departamento | INT | Departamento que controla el proyecto | FK → DEPARTAMENTO, NOT NULL |

### Entidad: `EMPLEADO`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| ssn | VARCHAR(11) | Número de seguro social del empleado | PK |
| nombre | VARCHAR(30) | Nombre(s) del empleado | NOT NULL |
| apellido | VARCHAR(30) | Apellido(s) del empleado | NOT NULL |
| direccion | VARCHAR(100) | Domicilio del empleado | NOT NULL |
| salario | DECIMAL(10,2) | Salario del empleado | NOT NULL |
| sexo | CHAR(1) | Sexo del empleado (M/F) | NOT NULL |
| fecha_nacimiento | DATE | Fecha de nacimiento del empleado | NOT NULL |
| numero_departamento | INT | Departamento al que está asignado el empleado | FK → DEPARTAMENTO, NOT NULL |
| ssn_supervisor | VARCHAR(11) | Supervisor directo del empleado (auto-referencia) | FK → EMPLEADO, NULL (el nivel más alto no tiene supervisor) |

### Entidad asociativa: `TRABAJA_EN`

> Relación M:N entre EMPLEADO y PROYECTO; un proyecto puede pertenecer a un departamento distinto al del empleado.

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| ssn_empleado | VARCHAR(11) | Empleado asignado al proyecto | FK → EMPLEADO |
| numero_proyecto | INT | Proyecto en el que trabaja el empleado | FK → PROYECTO |
| horas | DECIMAL(4,1) | Horas trabajadas por semana en ese proyecto | NOT NULL |

*(ssn_empleado, numero_proyecto) forman la clave primaria compuesta.*

### Entidad débil: `DEPENDIENTE`

| Atributo | Tipo de dato | Descripción | Restricción |
|---|---|---|---|
| ssn_empleado | VARCHAR(11) | Empleado del que depende esta persona | FK → EMPLEADO |
| nombre_dependiente | VARCHAR(30) | Nombre del dependiente | NOT NULL |
| sexo | CHAR(1) | Sexo del dependiente (M/F) | NOT NULL |
| fecha_nacimiento | DATE | Fecha de nacimiento del dependiente | NOT NULL |
| parentesco | VARCHAR(20) | Relación con el empleado (hijo/a, cónyuge, etc.) | NOT NULL |

*(ssn_empleado, nombre_dependiente) forman la clave primaria compuesta.*

### Relaciones y cardinalidades

| Relación | Entidades | Cardinalidad | Participación |
|---|---|:---:|---|
| GERENCIA | DEPARTAMENTO — EMPLEADO | 1:1 | Total en DEPARTAMENTO (todo departamento tiene un gerente) · Parcial en EMPLEADO (no todos gerencian) |
| TIENE_UBICACION | DEPARTAMENTO — UBICACION_DEPARTAMENTO | 1:N | Total en UBICACION_DEPARTAMENTO |
| CONTROLA | DEPARTAMENTO — PROYECTO | 1:N | Total en PROYECTO (todo proyecto pertenece a un departamento) |
| PERTENECE_A | EMPLEADO — DEPARTAMENTO | N:1 | Total en EMPLEADO (todo empleado está asignado a un departamento) |
| TRABAJA_EN | EMPLEADO — PROYECTO | N:M | Parcial en ambas entidades (un empleado puede no tener proyectos asignados en este esquema mínimo, y un proyecto podría no tener empleados) |
| SUPERVISA | EMPLEADO — EMPLEADO (recursiva) | 1:N | Parcial en ambos lados (no todo empleado supervisa, y el de mayor jerarquía no tiene supervisor) |
| TIENE_DEPENDIENTE | EMPLEADO — DEPENDIENTE | 1:N | Total en DEPENDIENTE · Parcial en EMPLEADO (puede no tener dependientes) |

