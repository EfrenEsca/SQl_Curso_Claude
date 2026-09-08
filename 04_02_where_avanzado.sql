USE EscuelaDB;
GO

-- LIKE se usa para buscar patrones de texto. 
-- El comodín '%' significa "cualquier cantidad de caracteres". Aquí busca apellidos que terminen en 'ez' (ej. Perez, Gomez).
SELECT Nombre, Apellido
FROM Alumnos
WHERE Apellido LIKE '%ez';
GO

-- IN permite filtrar buscando coincidencias exactas dentro de una lista específica. 
-- Es una forma más limpia de escribir múltiples condiciones OR (Nombre='Ana' OR Nombre='Diego').
SELECT Nombre,Apellido 
FROM Alumnos
WHERE Nombre IN ('Ana', 'Diego');
GO

-- BETWEEN se usa para buscar valores que estén dentro de un rango determinado.
-- Incluye tanto el valor inicial como el valor final. Es excelente para filtrar rangos de fechas.
SELECT Nombre, Apellido, FechaNacimiento
From Alumnos
Where FechaNacimiento BETWEEN '2004-01-01' AND '2005-12-31';
GO