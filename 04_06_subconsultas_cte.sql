USE EscuelaDB;
GO

-- SUBCONSULTA: Es una consulta dentro de otra. 
-- Primero se ejecuta el bloque dentro del paréntesis para averiguar el ID de 'Contreras', y el resultado se le pasa al WHERE de la consulta principal.
SELECT NombreCurso, CargaHoraria
FROM Cursos
WHERE ProfesorID = (
    SELECT ProfesorID
    FROM Profesores
    WHERE Apellido = 'Contreras'
);
GO

-- CTE (Expresión de Tabla Común): WITH crea una tabla temporal "virtual" que solo existe durante esta ejecución.
-- En este caso guarda el cálculo del promedio, y luego la consulta principal abajo puede invocar esa tabla para comparar su valor en el WHERE.
WITH PromedioGeneral AS (
    SELECT AVG(CAST(CargaHoraria AS DECIMAL(5,2))) AS PromedioHoras
    FROM Cursos
)
SELECT 
    Cursos.NombreCurso,
    Cursos.CargaHoraria
FROM Cursos
WHERE CargaHoraria > (SELECT PromedioHoras FROM PromedioGeneral);
GO

-- FUNCIÓN DE VENTANA: ROW_NUMBER() enumera las filas (1, 2, 3...) sin necesidad de agruparlas.
-- OVER(ORDER BY columna) le dice cómo debe ordenar los datos antes de ponerles el número. Aquí se los pone de mayor a menor (DESC) carga horaria.
SELECT 
    NombreCurso,
    CargaHoraria,
ROW_NUMBER() OVER (ORDER BY CargaHoraria DESC) AS Numero
FROM Cursos;
GO