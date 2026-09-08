USE EscuelaDB;
GO

--Eliminar tablas completas
--DROP TABLE Profesores;
--GO

ALTER TABLE Alumnos
ALTER COLUMN Email VARCHAR(150) NULL;
GO

ALTER TABLE Profesores 
DROP CONSTRAINT UN_Profesores_Especialidad;
GO
