USE EscuelaDB;
GO

INSERT INTO Alumnos(Nombre,Apellido,FechaNacimiento,Email)
VALUES ('Ana', 'García', '2005-03-14', 'ana.garcia@correo.com'),
    ('Luis', 'Martínez', '2004-11-02', 'luis.martinez@correo.com'),
    ('Sofía', 'Ramírez', '2006-07-22', NULL),
    ('Diego', 'Torres', '2005-01-30', 'diego.torres@correo.com');
GO

SELECT * FROM Alumnos;