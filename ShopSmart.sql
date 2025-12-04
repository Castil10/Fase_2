     1  -- Script básico para crear la base de datos ShopSmart orientada a una heladería.
     2  CREATE DATABASE ShopSmartDB;
     3  GO
     4  USE ShopSmartDB;
     5  GO
     6
     7  CREATE TABLE Clientes (
     8      Id INT IDENTITY(1,1) PRIMARY KEY,
     9      Documento NVARCHAR(50) NOT NULL,
    10      Nombre NVARCHAR(150) NOT NULL,
    11      Telefono NVARCHAR(50) NULL,
    12      Correo NVARCHAR(150) NULL,
    13      Direccion NVARCHAR(200) NULL,
    14      Activo BIT NOT NULL DEFAULT 1
    15  );
    16
    17  CREATE TABLE Proveedores (
    18      Id INT IDENTITY(1,1) PRIMARY KEY,
    19      Nombre NVARCHAR(150) NOT NULL,
    20      Telefono NVARCHAR(50) NULL,
    21      Correo NVARCHAR(150) NULL,
    22      Direccion NVARCHAR(200) NULL,
    23      Activo BIT NOT NULL DEFAULT 1
    24  );
    25
    26  CREATE TABLE Productos (
    27      Id INT IDENTITY(1,1) PRIMARY KEY,
    28      Codigo NVARCHAR(50) NOT NULL,
    29      Nombre NVARCHAR(150) NOT NULL,
    30      Descripcion NVARCHAR(250) NULL,
    31      Precio DECIMAL(18,2) NOT NULL,
    32      StockActual INT NOT NULL DEFAULT 0,
    33      StockMinimo INT NOT NULL DEFAULT 0,
    34      Activo BIT NOT NULL DEFAULT 1
    35  );
    36
    37  CREATE TABLE Ventas (
    38      Id INT IDENTITY(1,1) PRIMARY KEY,
    39      Fecha DATETIME NOT NULL,
    40      ClienteId INT NOT NULL REFERENCES Clientes(Id),
    41      Total DECIMAL(18,2) NOT NULL
    42  );
    43
    44  CREATE TABLE DetalleVenta (
    45      Id INT IDENTITY(1,1) PRIMARY KEY,
    46      VentaId INT NOT NULL REFERENCES Ventas(Id),
    47      ProductoId INT NOT NULL REFERENCES Productos(Id),
    48      Cantidad INT NOT NULL,
    49      PrecioUnitario DECIMAL(18,2) NOT NULL,
    50      Subtotal DECIMAL(18,2) NOT NULL
    51  );
    52
    53  -- Usuarios para autenticación básica
    54  CREATE TABLE Usuarios (
    55      Id INT IDENTITY(1,1) PRIMARY KEY,
    56      NombreUsuario NVARCHAR(50) NOT NULL,
    57      Contrasena NVARCHAR(50) NOT NULL,
    58      Rol NVARCHAR(50) NOT NULL
    59  );
    60
    61  INSERT INTO Usuarios (NombreUsuario, Contrasena, Rol) VALUES ('admin', 'admin', 'Administrador');
    62
    63  -- TODO: vistas para reporte de ventas diarias, productos con stock bajo y productos más vendidos.