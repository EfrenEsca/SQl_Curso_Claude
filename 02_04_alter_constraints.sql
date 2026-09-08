USE EscuelaDB;
GO

ALTER TABLE Cursos
--CHECK(CONDICION) Agrega una condicion que debe de tener un campo 
ADD CONSTRAINT CH_Cursos_Horario CHECK(CargaHoraria>0);

ALTER TABLE Profesores
ADD CONSTRAINT UN_Profesores_Especialidad UNIQUE (Especialidad);
GO

