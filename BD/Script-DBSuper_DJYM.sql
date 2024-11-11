CREATE TABLE PAGINA (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(255),
    URL VARCHAR(255)
);

CREATE TABLE PERFIL (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Descripcion VARCHAR(255)
);

CREATE TABLE PAGINA_PERFIL (
    CodigoPagina INT,
    IdPerfil INT,
    PRIMARY KEY (CodigoPagina, IdPerfil),
    FOREIGN KEY (CodigoPagina) REFERENCES PAGINA(Codigo),
    FOREIGN KEY (IdPerfil) REFERENCES PERFIL(Id)
);

CREATE TABLE CARGO (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(255),
    Saldo DECIMAL(10, 2)
);

CREATE TABLE EMPLEADO (
    Documento INT PRIMARY KEY,
    CodigoCargo INT,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    NumeroCelular VARCHAR(50),
    FechaNacimiento DATE,
    FOREIGN KEY (CodigoCargo) REFERENCES CARGO(Codigo)
);

CREATE TABLE USUARIO (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DocumentoEmpleado INT,
    Nombre VARCHAR(50),
    Clave VARCHAR(255),
    Salt VARCHAR(255),
    FOREIGN KEY (DocumentoEmpleado) REFERENCES EMPLEADO(Documento)
);

CREATE TABLE USUARIO_PERFIL (
    IdPerfil INT,
    IdUsuario INT,
    Activo BIT,
    PRIMARY KEY (IdPerfil, IdUsuario),
    FOREIGN KEY (IdPerfil) REFERENCES PERFIL(Id),
    FOREIGN KEY (IdUsuario) REFERENCES USUARIO(Id)
);

CREATE TABLE CAJA_REGISTRADORA (
    Numero INT PRIMARY KEY,
    Marca VARCHAR(50),
    Descripcion VARCHAR(255)
);

CREATE TABLE TURNO (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    DocumentoEmpleado INT,
    NumeroCajaRegistradora INT,
    Ingreso DATETIME UNIQUE,
    Salida DATETIME UNIQUE,
    FOREIGN KEY (DocumentoEmpleado) REFERENCES EMPLEADO(Documento),
    FOREIGN KEY (NumeroCajaRegistradora) REFERENCES CAJA_REGISTRADORA(Numero)
);

-- Crear índices únicos para Ingreso y Salida
CREATE UNIQUE INDEX idx_ingreso ON TURNO(Ingreso);
CREATE UNIQUE INDEX idx_salida ON TURNO(Salida);


CREATE TABLE OPERACION_CAJA (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    NumeroCajaRegistradora INT,
    ValorBase DECIMAL(10, 2),
    ValorCierre DECIMAL(10, 2),
    Fecha DATE UNIQUE,
    FOREIGN KEY (NumeroCajaRegistradora) REFERENCES CAJA_REGISTRADORA(Numero)
);
-- Crear índices únicos para Fecha
CREATE UNIQUE INDEX idx_Fecha ON OPERACION_CAJA(Fecha);

CREATE TABLE CLIENTE (
    Documento INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    NumeroCelular VARCHAR(50)
);

CREATE TABLE FACTURA_VENTA (
    Numero INT PRIMARY KEY IDENTITY(1,1),
    DocumentoCliente INT,
    NumeroCajaRegistradora INT,
    Total DECIMAL(10, 2) NULL,
    Fecha DATETIME,
    FOREIGN KEY (DocumentoCliente) REFERENCES CLIENTE(Documento),
    FOREIGN KEY (NumeroCajaRegistradora) REFERENCES CAJA_REGISTRADORA(Numero)
);

CREATE TABLE CATEGORIA (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Descripcion VARCHAR(255)
);

CREATE TABLE PRODUCTO (
    Codigo INT PRIMARY KEY,
    CodigoCategoria INT,
    Nombre VARCHAR(100),
    Stock INT,
    Descripcion VARCHAR(255),
    PrecioPublico DECIMAL(10, 2),
    PrecioProveedor DECIMAL(10, 2),
    FOREIGN KEY (CodigoCategoria) REFERENCES CATEGORIA(Codigo)
);


CREATE TABLE DETALLE_FACTURA_VENTA (
    NumeroFactura INT,
    CodigoProducto INT,
    Cantidad INT,
    Subtotal DECIMAL(10, 2) NULL,
    PRIMARY KEY (NumeroFactura, CodigoProducto),
    FOREIGN KEY (NumeroFactura) REFERENCES FACTURA_VENTA(Numero),
    FOREIGN KEY (CodigoProducto) REFERENCES PRODUCTO(Codigo)
);

CREATE TABLE PROVEEDOR (
    NIT INT PRIMARY KEY,
    Nombre VARCHAR(100),
    RazonSocial VARCHAR(100),
    NumeroCelular VARCHAR(50),
    Direccion VARCHAR(255)
);

CREATE TABLE FACTURA_COMPRA (
    Numero INT PRIMARY KEY IDENTITY(1,1),
    NITProveedor INT,
    DocumentoEmpleado INT,
    TotalVenta DECIMAL(10, 2),
    Fecha DATETIME,
    FOREIGN KEY (NITProveedor) REFERENCES PROVEEDOR(NIT),
    FOREIGN KEY (DocumentoEmpleado) REFERENCES EMPLEADO(Documento)
);

CREATE TABLE DETALLE_FACTURA_COMPRA (
    NumeroFacturaCompra INT,
    CodigoProducto INT,
    Cantidad INT,
    Subtotal DECIMAL(10, 2) NULL,
    PRIMARY KEY (NumeroFacturaCompra, CodigoProducto),
    FOREIGN KEY (NumeroFacturaCompra) REFERENCES FACTURA_COMPRA(Numero),
    FOREIGN KEY (CodigoProducto) REFERENCES PRODUCTO(Codigo)
);

CREATE TABLE PERIODO (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    Tipo VARCHAR(20),
    FechaInicio DATE,
    FechaFin DATE
);

CREATE TABLE REPORTE (
    Numero INT PRIMARY KEY IDENTITY(1,1),
    CodigoPeriodo INT,
    FOREIGN KEY (CodigoPeriodo) REFERENCES PERIODO(Codigo)
);

CREATE TABLE REPORTE_VENTAS (
    NumeroReporte INT,
    IngresosTotales DECIMAL(10, 2) NULL,
    PRIMARY KEY (NumeroReporte),
    FOREIGN KEY (NumeroReporte) REFERENCES REPORTE(Numero)
);

CREATE TABLE REPORTE_FACTURA_VENTAS (
    NumeroFactura INT,
    NumeroReporteVentas INT,
    PRIMARY KEY (NumeroFactura, NumeroReporteVentas),
    FOREIGN KEY (NumeroFactura) REFERENCES FACTURA_VENTA(Numero),
    FOREIGN KEY (NumeroReporteVentas) REFERENCES REPORTE_VENTAS(NumeroReporte)
);

CREATE TABLE REPORTE_COMPRAS (
    NumeroReporte INT,
    ValorComprasTotales DECIMAL(10, 2) NULL,
    PRIMARY KEY (NumeroReporte),
    FOREIGN KEY (NumeroReporte) REFERENCES REPORTE(Numero)
);

CREATE TABLE REPORTE_FACTURA_COMPRAS (
    NumeroFacturaCompra INT,
    NumeroReporteCompras INT,
    PRIMARY KEY (NumeroFacturaCompra, NumeroReporteCompras),
    FOREIGN KEY (NumeroFacturaCompra) REFERENCES FACTURA_COMPRA(Numero),
    FOREIGN KEY (NumeroReporteCompras) REFERENCES REPORTE_COMPRAS(NumeroReporte)
);

CREATE TABLE REPORTE_ROTACION (
    NumeroReporte INT,
    CantidadProductosMasRotados INT NULL,
    PRIMARY KEY (NumeroReporte),
    FOREIGN KEY (NumeroReporte) REFERENCES REPORTE(Numero)
);

CREATE TABLE REPORTE_FACTURA_ROTACION (
    CodigoProducto INT,
    NumeroFactura INT,
    NumeroReporteRotacion INT,
    PRIMARY KEY (CodigoProducto, NumeroFactura, NumeroReporteRotacion),
    FOREIGN KEY (CodigoProducto, NumeroFactura) REFERENCES DETALLE_FACTURA_VENTA(NumeroFactura, CodigoProducto),
    FOREIGN KEY (NumeroReporteRotacion) REFERENCES REPORTE_ROTACION(NumeroReporte)
);

