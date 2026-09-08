USE EscuelaDB;
GO

--INSERT INTO TABLA(CAMPOS) insertan los valores en los campos con el orden que se le da 
INSERT INTO Profesores(Nombre,Apellido,Especialidad,NumeroCelular)
VALUES('Jose','Lopez','Musica','986-228-7412');
GO

--BEGIN TRAN; crea una prueba temporal para el codigo siguiente, usado comunmente en DELETE
BEGIN TRAN;
DELETE FROM Profesores
WHERE ProfesorID = 1004;
GO

--SEKECT @@TRANCOUNT AS permite mostrar cuantas pruebas abiertas hay para ejecutarse
SELECT @@TRANCOUNT AS TransaccionesAbiertas;
SELECT * FROM Profesores
GO

--ROLLBACK deshace todas las transacciones abiertas sin importar cuantas haya 
ROLLBACK;

BEGIN TRAN;
DELETE Profesores
WHERE Nombre = 'Jose';

--COMMIT Cierra solo una transaccion 
COMMIT;
SELECT * FROM Profesores;
