USE EscuelaDB;
GO

SELECT Nombre, Apellido, Email
FROM Alumnos
WHERE Email IS NULL
ORDER BY Apellido ASC;