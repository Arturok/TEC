CREATE DATABASE SanJose_courierTEC
GO
USE SanJose_courierTEC
GO


CREATE TABLE Cliente(
CedulaCliente INT NOT NULL,
IdSucursalCliente INT NOT NULL,
NombreCliente VARCHAR(100) NOT NULL,
ApellidosCliente VARCHAR(100) NOT NULL,
NumeroCuentaCliente BIGINT NOT NULL,
TelefonoCliente INT NOT NULL,
IdTipoCliente INT NOT NULL,
ProvinciaCliente VARCHAR(100) NOT NULL,
CorreoCliente VARCHAR(100),
ContrasenaCliente VARCHAR(100)
PRIMARY KEY (CedulaCliente)
);

CREATE TABLE Paquete(
IdPaquete INT IDENTITY(1,1) NOT NULL,
IdSucursal INT not null,
FechaRecepcion DATE not null,
FechaRetiro DATE,
CedulaCliente INT not null,
IdCategoriaPaquete INT not null,
IdTipoPaquete INT not null,
Descripcion VARCHAR(200),
PesoPaquete FLOAT not null,
ValorPaquete INT not null,
MontoPagar INT not null,
PRIMARY KEY(IdPaquete, IdSucursal)
 );


CREATE TABLE CategoriaPaquete(
IdCategoriaPaquete int primary key identity(1,1),
CategoriaPaquete varchar(100) not null
);

CREATE TABLE TipoPaquete(
IdTipoPaquete INT PRIMARY KEY IDENTITY(1,1),
IdCategoriaPaquete INT not null,
TipoPaquete VARCHAR(100) not null
);

CREATE TABLE TipoCliente(
IdTipoCliente INT PRIMARY KEY IDENTITY(1,1),
TipoCliente VARCHAR(20) not null
);

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_TipoCliente_IdTipoCliente
FOREIGN KEY (IdTipoCliente) REFERENCES TipoCliente(IdTipoCliente)

ALTER TABLE Paquete
ADD CONSTRAINT FK_Paquete_Cliente_CedulaCliente
FOREIGN KEY (CedulaCliente) REFERENCES Cliente(CedulaCliente)

ALTER TABLE Paquete
ADD CONSTRAINT FK_Paquete_CategoriaPaquete_IdCategoriaPaquete
FOREIGN KEY (IdCategoriaPaquete) REFERENCES CategoriaPaquete(IdCategoriaPaquete)

ALTER TABLE Paquete
ADD CONSTRAINT FK_Paquete_TipoPaquete_IdTipoPaquete
FOREIGN KEY (IdTipoPaquete) REFERENCES TipoPaquete(IdTipoPaquete)

ALTER TABLE TipoPaquete
ADD CONSTRAINT FK_TipoPaquete_CategoriaPaquete_IdCategoriaPaquete
FOREIGN KEY (IdCategoriaPaquete) REFERENCES CategoriaPaquete(IdCategoriaPaquete)

INSERT INTO CategoriaPaquete VALUES 
('Regular'),
('Especial')

INSERT INTO TipoPaquete VALUES 
(1,'Electronica'),
(1,'Ropa'),
(1,'Juguetes'),
(2,'Hogar,'),
(2,'Comida'),
(2,'Baterias'),
(2,'Quimicos'),
(2,'Herramientas')

INSERT INTO TipoCliente VALUES 
('Bronce'),
('Oro'),
('Platino')

INSERT INTO Cliente VALUES 
(167121055,3,'Lucia','Perez',2148104063115849,86578813,1,'San Jose','lucia.perez@gmail.com','lucia.perez'),
(630793731,3,'Kattia','Barrantes',2445954589418514,74170561,1,'San Jose','kattia.barrantes@gmail.com','kattia.barrantes'),
(368524110,3,'Sofia','Vargas',2148104123115849,77396371,1,'San Jose','sofia.vargas@gmail.com','sofia.vargas')

INSERT INTO Paquete VALUES
(3,'2018-09-12',null,167121055,2,5,'Cantones con lechon',1,4000,5000),
(3,'2018-09-13',null,167121055,1,3,'Muñeco de Chucky',2,30000,33000),
(3,'2018-09-15','2018-09-17',630793731,1,1,'Audifonos',0.2,3500,4000),
(3,'2018-09-17',null,368524110,2,8,'Juego de Martillos',4,10000,13000)
GO

-- Procedimiento almacenado utilizado para registrar un cliente de la sucursal de San Jose
CREATE PROCEDURE SP_INSERT_CLIENTE_SUCURSAL
@CedulaCliente AS INT,
@IdSucursal AS INT,
@NombreCliente AS VARCHAR(100),
@ApellidosCliente AS VARCHAR(100),
@NumeroCuentaCliente AS BIGINT,
@TelefonoCliente AS INT,
@ProvinciaCliente AS VARCHAR(100),
@CorreoCliente AS VARCHAR(100),
@ContraseñaCliente VARCHAR(100)
AS
INSERT INTO Cliente VALUES 
(@CedulaCliente,@IdSucursal,@NombreCliente,@ApellidosCliente,@NumeroCuentaCliente,
@TelefonoCliente,1,@ProvinciaCliente,@CorreoCliente,@ContraseñaCliente)
GO



-- Procedimiento almacenado utilizado para registrar paquetes en la sucursal de San Jose
CREATE PROCEDURE SP_CREAR_PAQUETE
@CedulaCliente AS INT,
@IdCategoriaPaquete AS INT,
@IdTipoPaquete AS INT,
@Descripcion AS VARCHAR(200),
@PesoPaquete AS INT,
@ValorPaquete AS INT,
@MontoPagar AS INT
AS
INSERT INTO Paquete VALUES
(3,CONVERT(date, getdate()),NULL,@CedulaCliente,@IdCategoriaPaquete,@IdTipoPaquete,
@Descripcion,@PesoPaquete,@ValorPaquete,@MontoPagar)
GO


-- Procedimiento almacenado que la cantidad de dinero recaudado en la sucursal
CREATE PROCEDURE SP_DINERO_RECAUDADO
AS
SELECT SUM(P.MontoPagar) AS Monto FROM Paquete P WHERE (P.FechaRetiro IS NOT NULL)
GO


-- Procedimeinto almacenado que muesta la cantidad de paquetes según un cliente
-- específico para un rango de fechas específico
CREATE PROCEDURE SP_CANTIDAD_PAQUETES_PERIODO
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS 
SELECT C.CedulaCliente, C.NombreCliente, C.ApellidosCliente, COUNT(P.FechaRetiro) AS Cantidad 
FROM Cliente C 
INNER JOIN Paquete P ON P.CedulaCliente = C.CedulaCliente
WHERE (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL)  
GROUP BY C.CedulaCliente, C.NombreCliente, C.ApellidosCliente
ORDER  BY Cantidad DESC
GO


-- Procedimiento almacenado que muestra un listado de todos los paquetes 
-- pertenecientes a un cliente específico
CREATE PROCEDURE SP_DESCRIPCION_FECHARETIRO_PAQUETES_CLIENTE
@CEDCLIENTE AS INT
AS
SELECT P.Descripcion,P.FechaRetiro,P.IdPaquete,P.IdSucursal,P.FechaRecepcion,
P.MontoPagar,P.IdTipoPaquete,P.IdCategoriaPaquete,P.PesoPaquete 
FROM Paquete P WHERE (P.CedulaCliente=@CEDCLIENTE)
GO

-- Procedimiento almacenado que muestra un listado de los paquetes 
-- no retirados por parte de un cliente específico
CREATE PROCEDURE SP_DESCRIPCION_PAQUETES_PENDIENTES_CLIENTE
@CEDCLIENTE AS INT
AS
SELECT P.Descripcion,P.IdPaquete,P.IdSucursal,P.FechaRecepcion,
P.MontoPagar,P.IdTipoPaquete,P.IdCategoriaPaquete,P.PesoPaquete 
FROM Paquete P WHERE (P.CedulaCliente=@CEDCLIENTE AND P.FechaRetiro IS NULL)
GO


-- Procedimiento almacenado que muestra el monto promedio pagado por paquete 
-- por cliente para un periodo de fechas específico
CREATE PROCEDURE SP_MONTOPROMEDIO_PAQUETES_PERIODO
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS 
SELECT C.CedulaCliente, C.NombreCliente, C.ApellidosCliente, AVG(P.MontoPagar) AS Promedio 
FROM Cliente C INNER JOIN Paquete P ON P.CedulaCliente = C.CedulaCliente
WHERE (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL)  
GROUP BY C.CedulaCliente, C.NombreCliente, C.ApellidosCliente
ORDER  BY Promedio DESC
GO


-- Procedimiento almacenado que muestra el monto del paquete para un 
-- tipo de paquete específico para un periodo en particular
CREATE PROCEDURE SP_MONTOPAQUETE_PERIODO
@IDTIPOPAQUETE AS INT,
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS
SELECT T.TipoPaquete, SUM(P.MontoPagar) AS Monto 
FROM Paquete P INNER JOIN  TipoPaquete T 
ON (T.IdTipoPaquete=@IDTIPOPAQUETE and P.IdTipoPaquete=@IDTIPOPAQUETE)
WHERE (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL)
GROUP BY T.TipoPaquete
ORDER  BY MONTO DESC
GO


-- Procedimiento almacenado ejecutado por un empleado para realiza la venta de un producto que el 
-- cliente llega a retirar a la sucursal
CREATE PROCEDURE SP_VENTA
@IDPAQUETE AS VARCHAR(100)
AS 
UPDATE Paquete SET FechaRetiro=CONVERT(date, getdate()) WHERE (IdPaquete=@IDPAQUETE)
GO

SELECT * FROM Cliente
SELECT * From Paquete

EXECUTE SP_DINERO_RECAUDADO