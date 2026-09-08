USE EscuelaDB;
GO

-- Aquí insertamos a una profesora nueva, pero NO la vamos a registrar en ningún curso.
-- Esto sirve como experimento para que, al ejecutar un LEFT JOIN (como el archivo anterior), compruebes que Laura aparecerá en la lista aunque el valor de su curso sea NULL.
INSERT INTO Profesores (Nombre, Apellido, Especialidad, NumeroCelular)
VALUES ('Laura', 'Mendoza', 'Historia', '667-900-1234');
GO