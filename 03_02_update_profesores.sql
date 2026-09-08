USE EscuelaDB;
GO

--UPDATE TABLA permite modificar un campo de la tabla
UPDATE Profesores
--SET selecciona el nombre del campo y a ese se le asigna el valor nuevo
SET Nombre = 'Marco'

--WHERE es la clausula con la que se asocia al campo a cambiar, se usa normalmente la llave primaria
WHERE ProfesorID = 2;
GO

SELECT * FROM Profesores;
GO