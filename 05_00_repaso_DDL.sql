-------------------Modulo #1---------------------------
USE EscuelaDB;
GO

DROP TABLE Matriculas;
GO


CREATE TABLE Matriculas(
MatriculaID INT IDENTITY(1,1) PRIMARY KEY,
AlumnoID INT NOT NULL,
CursoID INT NOT NULL,
FechaMatricula DATE NOT NULL DEFAULT GETDATE(),
Calificacion DECIMAL(4,2) NULL,
CONSTRAINT FK_Matriculas_alumno FOREIGN KEY(AlumnoID) REFERENCES Alumnos(alumnoID),
CONSTRAINT FK_Matriculas_cursos FOREIGN KEY(cursoID) REFERENCES Cursos(CursoID),
CONSTRAINT CK_calificacion_Rango CHECK (Calificacion BETWEEN 0 AND 10) 
);
GO
-------------------Modulo #1---------------------------

-------------------Modulo #2---------------------------
INSERT INTO Matriculas(AlumnoID,cursoID,Calificacion)
VALUES
    (1,2,9.2),
    (2,3,5.4),
    (3,2,7.0),
    (4,1,6.7),
    (1002,3,2.3);
GO

UPDATE Matriculas
SET Calificacion = 8.56
WHERE MatriculaID = 1002;
GO

UPDATE Matriculas
SET Calificacion = 4.47
WHERE MatriculaID = 3;
GO

INSERT INTO Matriculas(AlumnoID,cursoID,Calificacion)
VALUES(4,2,9.99);
GO

BEGIN TRAN;
DELETE FROM Matriculas
WHERE MatriculaID = 6;
GO

SELECT @@TRANCOUNT AS TransaccionesAbiertas;
SELECT * FROM Matriculas;
GO

COMMIT;
SELECT * FROM Matriculas;
-------------------Modulo #2---------------------------

-------------------Modulo #3---------------------------

SELECT
    Alumnos.Nombre AS NombreAlumno,
    Alumnos.Apellido AS ApellidoAlumno,
    Cursos.NombreCurso,
    Profesores.Nombre As NombreProfesor,
    Profesores.Apellido AS ApellidoProfesor
FROM Matriculas
INNER JOIN Alumnos ON Matriculas.AlumnoID = Alumnos.alumnoID
INNER JOIN Cursos ON Matriculas.cursoID = Cursos.CursoID
INNER JOIN Profesores ON Cursos.ProfesorID = Profesores.ProfesorID;
GO


SELECT Cursos.NombreCurso, COUNT(Matriculas.AlumnoID) AS CantidadAlumnos
FROM Cursos
INNER JOIN  Matriculas ON Cursos.CursoID = Matriculas.cursoID
GROUP BY Cursos.NombreCurso
HAVING COUNT(Matriculas.AlumnoID) >= 2;
GO


SELECT AlumnoID 
FROM Matriculas
WHERE Calificacion >(
    SELECT AVG(Calificacion) AS PromedioCalificaciones
    FROM Matriculas
);
GO

SELECT  
    Calificacion,
    AlumnoID,
    RANK() OVER(ORDER BY Calificacion DESC) AS Posicion
FROM Matriculas;
GO


-------------------Modulo #3---------------------------