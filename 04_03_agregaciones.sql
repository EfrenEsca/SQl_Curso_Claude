USE EscuelaDB;
GO

-- SUM() es una función de agregación que suma todos los valores numéricos de una columna.
-- GROUP BY agrupa las filas para calcular subtotales. Aquí estamos sumando la carga horaria por cada maestro.
SELECT ProfesorID, SUM(CargaHoraria) AS TotalHoras
FROM Cursos
GROUP BY ProfesorID;
GO

-- AVG() calcula el promedio de una columna.
-- CAST(columna AS tipo) convierte un tipo de dato a otro. Aquí se cambia a DECIMAL (5 dígitos en total, 2 decimales) para que el promedio sea exacto y no redondee enteros.
SELECT AVG(CAST(CargaHoraria AS DECIMAL (5,2))) AS PromedioHoras
FROM Cursos;
GO

-- COUNT(*) cuenta cuántas filas o registros existen en cada grupo.
-- HAVING funciona exactamente igual que WHERE, pero es EXCLUSIVO para usarse después de un GROUP BY (filtra grupos, no filas individuales).
SELECT ProfesorID, COUNT(*) AS CantidadCursos
FROM Cursos
GROUP BY ProfesorID
HAVING COUNT(*) > 1;
GO