# Teoría Fundamental de SQL Server: Del Diseño al Rendimiento

Esta guía condensa la teoría esencial del Modelo Relacional y el lenguaje SQL. Está diseñada no solo para aprender sintaxis, sino para comprender cómo estructurar bases de datos profesionales, tomando como referencia el proyecto `EscuelaDB` y su futura aplicación de agenda estudiantil.

---

## 1. El Modelo Relacional y la Normalización

Antes de escribir código, los datos deben diseñarse lógicamente. Las bases de datos relacionales evitan la redundancia de datos (no repetir información innecesariamente) dividiendo la información en tablas interconectadas.

### Normalización Básica (Las 3 Formas Normales)
Para que una base de datos sea eficiente, debe cumplir ciertas reglas de normalización:
1.  **Primera Forma Normal (1FN):** Cada columna debe contener un solo valor indivisible. No puedes tener una columna `Cursos` que diga "Matemáticas, Historia, Física". Deben ser registros separados.
2.  **Segunda Forma Normal (2FN):** Todos los datos de una tabla deben depender por completo de su Llave Primaria.
3.  **Tercera Forma Normal (3FN):** Los datos no deben depender de otros datos que no sean la Llave Primaria (evitar dependencias transitivas). Por ejemplo, si tienes `AlumnoID`, no debes guardar su `Edad` si ya estás guardando su `FechaNacimiento` (la edad se calcula).

---

## 2. Lenguaje de Definición de Datos (DDL)

El DDL (`CREATE`, `ALTER`, `DROP`) construye el "esqueleto" de la base de datos. Se rige por reglas estrictas de integridad.

### Llaves y Relaciones
*   **Primary Key (PK - Llave Primaria):** El identificador único e irrepetible de un registro. Es el "DNI" de la fila (ej. `AlumnoID`).
*   **Foreign Key (FK - Llave Foránea):** Columna que hace referencia a la PK de otra tabla. Garantiza la **Integridad Referencial**: asegura que no existan datos huérfanos (ej. no puedes matricular a un alumno en un `CursoID` que no existe).

### Tipos de Relaciones
*   **1 a 1 (1:1):** Un registro de la Tabla A se asocia con un solo registro de la Tabla B. (Ej. `Alumno` y `DetalleMedicoAlumno`).
*   **1 a Muchos (1:N):** Un registro de la Tabla A se asocia con muchos de la Tabla B. La FK siempre va en la tabla "Muchos". (Ej. Un `Profesor` imparte muchos `Cursos`; la tabla `Cursos` lleva el `ProfesorID`).
*   **Muchos a Muchos (N:M):** Un alumno toma muchos cursos y un curso tiene muchos alumnos. SQL no soporta esto físicamente, por lo que **se crea una tabla puente** (ej. la tabla `Matriculas` que contiene `AlumnoID` y `CursoID`).

### Restricciones de Dominio (Constraints)
Reglas a nivel de base de datos para evitar "datos basura":
*   `NOT NULL`: El campo es obligatorio.
*   `UNIQUE`: El valor no puede repetirse en toda la tabla (ej. Email).
*   `CHECK`: Valida una regla lógica (ej. `CHECK (Calificacion >= 0 AND Calificacion <= 10)`).
*   `DEFAULT`: Asigna un valor por defecto si el usuario no envía uno (ej. `DEFAULT GETDATE()` para guardar la fecha de creación de una tarea).

---

## 3. Manipulación de Datos y Transacciones (DML y TCL)

El DML (`INSERT`, `UPDATE`, `DELETE`) modifica la información, y el TCL (`COMMIT`, `ROLLBACK`) asegura que esas modificaciones sean seguras aplicando las **Propiedades ACID**:

*   **A - Atomicidad:** Las transacciones son "todo o nada". Si una operación de varios pasos falla a la mitad, no se guarda nada.
*   **C - Consistencia:** Una transacción solo puede llevar la base de datos de un estado válido a otro estado válido (respetando las Constraints).
*   **I - Aislamiento:** Las transacciones concurrentes no interfieren entre sí. Si dos estudiantes se inscriben al mismo curso al mismo tiempo, el sistema las procesa en fila.
*   **D - Durabilidad:** Una vez hecho el `COMMIT`, los datos están seguros incluso si el servidor se apaga repentinamente.

### Control de Transacciones
```sql
BEGIN TRAN; -- Inicia la zona segura
-- Hacer INSERTs o UPDATEs
-- Si todo sale bien:
COMMIT; -- Guarda permanentemente
-- Si hay un error:
ROLLBACK; -- Deshace todo y regresa al estado original