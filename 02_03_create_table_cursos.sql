USE EscuelaDB;
GO

--DROP TABLE Elimina una tabla de la DB
--IF EXIST nombre_de_la_tabla verifica que la tabla exista 
DROP TABLE IF EXISTS Cursos;
GO

CREATE TABLE Cursos(
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCurso VARCHAR(100) NOT NULL,
    CargaHoraria INT NOT NULL,
    ProfesorID INT NOT NULL,
    
    --CONSTRAINT Le asignamos un nombre propio facil de recordar con la sintaxis fk_TablaHija_TablaPadre
    --FOREIGN KEY (ProfesorID) Asigna como llave foranea al campo de la tabla que se utiliza en la tabla padre
    --REFERENCES Profesores(ProfesorID) Indica a que tabla se hara la conexion de la llave foranea mencionando la tabla y la llave primaria de esa misma 
    CONSTRAINT fk_Cursos_Profesores FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);
GO