-- Crear base de datos
CREATE DATABASE EscuelaDB;
--Cierra el lote de comandos
GO

--Cambiar el contexto de ejecucion
Use EscuelaDb;
GO

--Crear tabla 
CREATE TABLE Alumnos (
    --IDNETITY Asigna el primer numero a una lista de alumnos y lo va incrementando en 1
    --PRIMARY KEY se le asigna al dato que no se repetira
    alumnoID INT IDENTITY (1,1) PRIMARY KEY,
    --NOT NULL Obliga a agregar un nombre al campo
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    --DATE es el tipo de dato para guardar fechas (año-mes-dia)
    FechaNacimiento DATE NOT NULL,
    --NULL Si no se agrega el NOT quiere decir que el campo puede uqedar vacio
    Email VARCHAR(100) NULL,
    --DATETIME Guarda fecha y hora 
    --DEFAULT GETDATE() si no se agrega un valor a este campo se le agrega la fecha actual automaticamente
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
);
GO

