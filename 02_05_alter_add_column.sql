USE EscuelaDB;
GO


--ALTER TABLE Selecciona la tabla que quieres modificar
ALTER TABLE Profesores
--ADD indica que se agregara otro
ADD NumeroCelular VARCHAR(15) NULL;
GO

ALTER TABLE Profesores
ADD CONSTRAINT UQ_Profesores_NumeroCelular UNIQUE (NumeroCelular);
GO