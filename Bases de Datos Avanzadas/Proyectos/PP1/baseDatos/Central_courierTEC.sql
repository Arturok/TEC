CREATE DATABASE Central_courierTEC
GO
USE Central_courierTEC
GO


CREATE TABLE Sucursal(
IdSucursal INT PRIMARY KEY IDENTITY(1,1),
NombreSucursal VARCHAR(100) NOT NULL,
DetalleSucursal VARCHAR(100),
IdAdmin INT,
Telefono INT NOT NULL,
CorreoElectronico VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
CedulaEmpleado INT PRIMARY KEY,
NombreEmpleado VARCHAR(100) NOT NULL,
ApellidosEmpleado VARCHAR(100) NOT NULL,
IdSucursalEmpleado INT NOT NULL,
CorreoEmpleado VARCHAR(100) UNIQUE NOT NULL,
ContrasenaEmpleado VARCHAR(100) NOT NULL,
TelefonoEmpleado INT NOT NULL,
IdRolEmpleado INT NOT NULL
);


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

CREATE TABLE Rol(
IdRol INT PRIMARY KEY IDENTITY(1,1),
Rol VARCHAR(100) not null,
DescripcionRol VARCHAR(200)
);

CREATE TABLE TipoCliente(
IdTipoCliente INT PRIMARY KEY IDENTITY(1,1),
TipoCliente VARCHAR(20) not null
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

ALTER TABLE Sucursal
ADD CONSTRAINT FK_Sucursal_Usuario_CedulaUsuario
FOREIGN KEY (IdAdmin) REFERENCES Empleado(CedulaEmpleado)

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_TipoCliente_IdTipoCliente
FOREIGN KEY (IdTipoCliente) REFERENCES TipoCliente(IdTipoCliente)


ALTER TABLE Empleado
ADD CONSTRAINT FK_Empleado_Sucursal_IdSucursalEmpleado
FOREIGN KEY (IdSucursalEmpleado) REFERENCES Sucursal(IdSucursal)

ALTER TABLE Empleado
ADD CONSTRAINT FK_Empleado_Rol_IdRolEmpleado
FOREIGN KEY (IdRolEmpleado) REFERENCES Rol(IdRol)

ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Sucursal_IdSucursalCliente
FOREIGN KEY (IdSucursalCliente) REFERENCES Sucursal(IdSucursal)

ALTER TABLE Paquete
ADD CONSTRAINT FK_Paquete_Sucursal_IdSucursal
FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)

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

INSERT INTO Rol VALUES
('Administrador','Administrador de un surcursal'),
('Cajero','Atiende la sucursal')

INSERT INTO TipoCliente VALUES
('Bronce'),
('Oro'),
('Platino')

INSERT INTO Sucursal VALUES 
('Heredia','Sucursal de Heredia',NULL,181334149,'heredia@gmail.com'),
('Cartago','Sucursal de Cartago',NULL,500888241,'cartago@gmail.com'),
('San Jose','Sucursal de San Jose',NULL,734421856,'sanjose@gmail.com');

INSERT INTO Empleado VALUES
(231334149,'Esteban','Herrera',1,'esteban.herrera@gmail.com','estebanherrera',80378578,1),
(510988241,'Ronny','Quesada',2,'ronny.quesada@gmail.com','ronnyquesada',72629879,1),
(435425856,'Arturo','Chinchilla',3,'arturo.chinchilla@gmail.com','arturochinchilla',60288955,1),
(543148074,'Juan','Perez',1,'juan.perez@gmail.com','juanperez',70372992,2),
(555555555,'Gabriel','Arias',2,'gabriel.arias@gmail.com','gabrielarias',63961150,2),
(754067025,'Andres','Brais',3,'andres.brais@gmail.com','andres.brais',88658952,2)

INSERT INTO Cliente VALUES 
(396068297,1,'Daniel','Sanchez',2791152432613367,61887482,1,'Heredia','daniel.sanchez@gmail.com','daniel.sanchez'),
(120283944,1,'Josue','Arias',2392572036797993,61754173,1,'Heredia','josue.arias@gmail.com','josue.arias'),
(372070001,1,'Pedro','Fernandez',2234631380462324,64370760,1,'Alajuela','pedro.fernandez@gmail.com','pedro.fernandez')

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


INSERT INTO Paquete VALUES 
(1,'2018-09-14',null,396068297,1,1,'Cable USB Tipo C',0.3,4500,5000),
(1,'2018-09-18','2018-09-20',396068297,1,2,'Camiseta Star Wars',0.75,11000,15000),
(1,'2018-09-18','2018-09-21',396068297,2,4,'Vajilla',4,35000,47000)
GO


-- Procedimiento almacenado utilizado para registrar un cliente de la sucursal central(Heredia)
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


-- Procedimiento almacenado utilizado para registrar paquetes en la sucursal central(Heredia)
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
(1,CONVERT(date, getdate()),NULL,@CedulaCliente,@IdCategoriaPaquete,@IdTipoPaquete,
@Descripcion,@PesoPaquete,@ValorPaquete,@MontoPagar)
GO

-- Procedimiento almacenado que verifica la autenticacion de un empleado
CREATE PROCEDURE SP_LOGINEMPLEADO
@CORREO AS VARCHAR(100),
@CONTRASENA AS VARCHAR(100)
AS
BEGIN
SELECT * FROM EMPLEADO E
WHERE (E.CorreoEmpleado = @CORREO AND E.ContrasenaEmpleado = @CONTRASENA)
END
GO


-- Procedimiento almacenado que verifica la autenticacion de un cliente
CREATE PROCEDURE SP_LOGINCLIENTE
@CORREO AS VARCHAR(100),
@CONTRASENA AS VARCHAR(100)
AS
BEGIN
SELECT * FROM Cliente C
WHERE (C.CorreoCliente = @CORREO AND C.ContrasenaCliente = @CONTRASENA)
END
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
WHERE (P.IdSucursal=1 AND (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL))
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
FROM Paquete P WHERE (P.CedulaCliente=@CEDCLIENTE AND P.IdSucursal=1)
GO

-- Procedimiento almacenado que muestra un listado de los paquetes 
-- no retirados por parte de un cliente específico
CREATE PROCEDURE SP_DESCRIPCION_PAQUETES_PENDIENTES_CLIENTE
@CEDCLIENTE AS INT
AS
SELECT P.Descripcion,P.IdPaquete,P.IdSucursal,P.FechaRecepcion,
P.MontoPagar,P.IdTipoPaquete,P.IdCategoriaPaquete,P.PesoPaquete 
FROM Paquete P WHERE (P.CedulaCliente=@CEDCLIENTE AND P.IdSucursal=1 AND P.FechaRetiro IS NULL)
GO

-- Procedimiento almacenado que muestra el monto promedio pagado por paquete 
-- por cliente para un periodo de fechas específico
CREATE PROCEDURE SP_MONTOPROMEDIO_PAQUETES_PERIODO
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS 
SELECT C.CedulaCliente, C.NombreCliente, C.ApellidosCliente, AVG(P.MontoPagar) AS Promedio 
FROM Cliente C INNER JOIN Paquete P ON P.CedulaCliente = C.CedulaCliente
WHERE (P.IdSucursal=1 AND (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL)) 
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
WHERE (P.IdSucursal=1 AND (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL))
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


-- Procedimiento almacenado que obtiene el monto recaudado por sucursal para un periodo específico
CREATE PROCEDURE SP_MONTO_SURCURSAL_PERIODO
@IDSUCURSAL AS INT,
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS
SELECT SUM(P.MontoPagar) AS Monto FROM Paquete P
WHERE (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL) AND (P.IdSucursal=@IDSUCURSAL)
GO


-- Procedimiento almacenado que obtiene el monto recaudado por sucursal 
-- y por tipo de paquete para un periodo específico. 
CREATE PROCEDURE SP_MONTO_SUCURSAL_TIPOPAQUETE_PERIODO
@IDSUCURSAL AS INT,
@TIPO_PAQUETE AS INT,
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS 
SELECT SUM(MontoPagar) AS Monto FROM Paquete P 
WHERE (P.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL) AND (P.IdSucursal=@IDSUCURSAL) and (P.IdTipoPaquete=@TIPO_PAQUETE)
GO


-- Procedimiento almacenado que muestra un listado de los tres mejores clientes
-- (los que tenga un monto mayor en el total de paquetes que hayan traído) en un periodo específico
CREATE PROCEDURE SP_TRES_MEJORES_CLIENTESXPERIODO
@FECHA_INICIAL AS DATE,
@FECHA_FINAL AS DATE
AS
SELECT TOP 3 A.CedulaCliente,A.NombreCliente,A.ApellidosCliente,A.TelefonoCliente,
A.IdTipoCliente,A.ProvinciaCliente,SUM(B.MontoPagar) AS Monto 
FROM Cliente A INNER JOIN Paquete B ON A.CedulaCliente=B.CedulaCliente 
WHERE (B.FechaRetiro BETWEEN @FECHA_INICIAL AND @FECHA_FINAL)  
Group by A.CedulaCliente,A.NombreCliente,A.ApellidosCliente,A.TelefonoCliente,A.IdTipoCliente,A.ProvinciaCliente 
ORDER BY SUM(B.MontoPagar)DESC	
GO

ALTER PROCEDURE SP_DINERO_RECAUDADO
AS
SELECT SUM(P.MontoPagar) AS Monto FROM Paquete P WHERE (P.FechaRetiro IS NOT NULL AND P.IdSucursal = 1)
GO
