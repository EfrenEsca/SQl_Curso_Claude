USE EscuelaDB;

INSERT INTO Cursos(NombreCurso,CargaHoraria,ProfesorID)
VALUES
    ('Programación I', 60, 1),
    ('Bases de Datos', 45, 1),
    ('Redes I', 40, 2),
    ('Álgebra Lineal', 50, 1);
GO

SELECT * FROM Cursos;