USE EscuelaDB;
GO

-- INNER JOIN cruza ambas tablas de forma estricta. 
-- Solo mostrará resultados si el curso tiene un profesor válido y el profesor tiene cursos asignados.
SELECT
    Cursos.CargaHoraria,
    Cursos.NombreCurso,
    Profesores.Nombre,
    Profesores.Apellido
From Cursos
INNER JOIN Profesores ON Cursos.ProfesorID = Profesores.ProfesorID;
GO

-- LEFT JOIN le da prioridad a la tabla izquierda (la que está en el FROM, en este caso Profesores). 
-- Mostrará todos los profesores en la base de datos, incluso si no tienen ningún curso emparejado a su nombre (rellenando con NULL los datos del curso).
SELECT 
    Profesores.Nombre,
    Profesores.Apellido,
    Cursos.NombreCurso
FROM Profesores
LEFT JOIN Cursos ON Profesores.ProfesorID = Cursos.ProfesorID;
GO