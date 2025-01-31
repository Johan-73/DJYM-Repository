USE [master]
GO
/****** Object:  Database [DBSuper_DJYM]    Script Date: 11/11/2024 11:21:28 a. m. ******/
CREATE DATABASE [DBSuper_DJYM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSuper_DJYM', FILENAME = N'D:\BaseDatos\Datos\DBSuper_DJYM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBSuper_DJYM_log', FILENAME = N'D:\BaseDatos\Logs\DBSuper_DJYM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBSuper_DJYM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSuper_DJYM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSuper_DJYM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSuper_DJYM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSuper_DJYM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBSuper_DJYM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSuper_DJYM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSuper_DJYM] SET  MULTI_USER 
GO
ALTER DATABASE [DBSuper_DJYM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSuper_DJYM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSuper_DJYM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSuper_DJYM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBSuper_DJYM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBSuper_DJYM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSuper_DJYM', N'ON'
GO
ALTER DATABASE [DBSuper_DJYM] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBSuper_DJYM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBSuper_DJYM]
GO
/****** Object:  Table [dbo].[CAJA_REGISTRADORA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAJA_REGISTRADORA](
	[Numero] [int] NOT NULL,
	[Marca] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Saldo] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[Documento] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](255) NULL,
	[NumeroCelular] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_FACTURA_COMPRA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_FACTURA_COMPRA](
	[NumeroFacturaCompra] [int] NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroFacturaCompra] ASC,
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_FACTURA_VENTA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_FACTURA_VENTA](
	[NumeroFactura] [int] NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroFactura] ASC,
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[Documento] [int] NOT NULL,
	[CodigoCargo] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](255) NULL,
	[NumeroCelular] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA_COMPRA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA_COMPRA](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[NITProveedor] [int] NULL,
	[DocumentoEmpleado] [int] NULL,
	[TotalVenta] [decimal](10, 2) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA_VENTA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA_VENTA](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoCliente] [int] NULL,
	[NumeroCajaRegistradora] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPERACION_CAJA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPERACION_CAJA](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[NumeroCajaRegistradora] [int] NULL,
	[ValorBase] [decimal](10, 2) NULL,
	[ValorCierre] [decimal](10, 2) NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGINA]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGINA](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](255) NULL,
	[URL] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGINA_PERFIL]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGINA_PERFIL](
	[CodigoPagina] [int] NOT NULL,
	[IdPerfil] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPagina] ASC,
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERFIL]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERFIL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERIODO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERIODO](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](20) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[Codigo] [int] NOT NULL,
	[CodigoCategoria] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Stock] [int] NULL,
	[Descripcion] [varchar](255) NULL,
	[PrecioPublico] [decimal](10, 2) NULL,
	[PrecioProveedor] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[NIT] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[RazonSocial] [varchar](100) NULL,
	[NumeroCelular] [varchar](50) NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE](
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPeriodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_COMPRAS]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_COMPRAS](
	[NumeroReporte] [int] NOT NULL,
	[ValorComprasTotales] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_FACTURA_COMPRAS]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_FACTURA_COMPRAS](
	[NumeroFacturaCompra] [int] NOT NULL,
	[NumeroReporteCompras] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroFacturaCompra] ASC,
	[NumeroReporteCompras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_FACTURA_ROTACION]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_FACTURA_ROTACION](
	[CodigoProducto] [int] NOT NULL,
	[NumeroFactura] [int] NOT NULL,
	[NumeroReporteRotacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC,
	[NumeroFactura] ASC,
	[NumeroReporteRotacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_FACTURA_VENTAS]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_FACTURA_VENTAS](
	[NumeroFactura] [int] NOT NULL,
	[NumeroReporteVentas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroFactura] ASC,
	[NumeroReporteVentas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_ROTACION]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_ROTACION](
	[NumeroReporte] [int] NOT NULL,
	[CantidadProductosMasRotados] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTE_VENTAS]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTE_VENTAS](
	[NumeroReporte] [int] NOT NULL,
	[IngresosTotales] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURNO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURNO](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoEmpleado] [int] NULL,
	[NumeroCajaRegistradora] [int] NULL,
	[Ingreso] [datetime] NULL,
	[Salida] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoEmpleado] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Clave] [varchar](255) NULL,
	[Salt] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO_PERFIL]    Script Date: 11/11/2024 11:21:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO_PERFIL](
	[IdPerfil] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CAJA_REGISTRADORA] ([Numero], [Marca], [Descripcion]) VALUES (1, N'Casio', N'Caja registradora de uso general')
INSERT [dbo].[CAJA_REGISTRADORA] ([Numero], [Marca], [Descripcion]) VALUES (2, N'Sharp', N'Caja registradora para supermercado')
INSERT [dbo].[CAJA_REGISTRADORA] ([Numero], [Marca], [Descripcion]) VALUES (3, N'Samsung', N'Caja registradora con pantalla táctil')
INSERT [dbo].[CAJA_REGISTRADORA] ([Numero], [Marca], [Descripcion]) VALUES (4, N'OLivetti', N'Caja registradora con impresora integrada')
INSERT [dbo].[CAJA_REGISTRADORA] ([Numero], [Marca], [Descripcion]) VALUES (5, N'Epson', N'Caja registradora para tienda de ropa')
GO
SET IDENTITY_INSERT [dbo].[CARGO] ON 

INSERT [dbo].[CARGO] ([Codigo], [Descripcion], [Saldo]) VALUES (1, N'Gerente', CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[CARGO] ([Codigo], [Descripcion], [Saldo]) VALUES (2, N'Vendedor', CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[CARGO] ([Codigo], [Descripcion], [Saldo]) VALUES (3, N'Contador', CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[CARGO] ([Codigo], [Descripcion], [Saldo]) VALUES (4, N'Soporte Técnico', CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[CARGO] ([Codigo], [Descripcion], [Saldo]) VALUES (5, N'Administrador', CAST(4000000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[CARGO] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([Codigo], [Nombre], [Descripcion]) VALUES (1, N'Electrónica', N'Productos de electrónica y tecnología')
INSERT [dbo].[CATEGORIA] ([Codigo], [Nombre], [Descripcion]) VALUES (2, N'Hogar', N'Artículos para el hogar y la cocina')
INSERT [dbo].[CATEGORIA] ([Codigo], [Nombre], [Descripcion]) VALUES (3, N'Ropa', N'Prendas de vestir y accesorios')
INSERT [dbo].[CATEGORIA] ([Codigo], [Nombre], [Descripcion]) VALUES (4, N'Alimentos', N'Productos de consumo alimenticio')
INSERT [dbo].[CATEGORIA] ([Codigo], [Nombre], [Descripcion]) VALUES (5, N'Juguetes', N'Juguetes y artículos de entretenimiento para niños')
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
INSERT [dbo].[CLIENTE] ([Documento], [Nombre], [Direccion], [NumeroCelular]) VALUES (1010101, N'Carlos Pérez', N'Av. Principal 123, Ciudad A', N'3001234567')
INSERT [dbo].[CLIENTE] ([Documento], [Nombre], [Direccion], [NumeroCelular]) VALUES (2020202, N'Ana Martínez', N'Calle Secundaria 456, Ciudad B', N'3002345678')
INSERT [dbo].[CLIENTE] ([Documento], [Nombre], [Direccion], [NumeroCelular]) VALUES (3030303, N'Luis Gómez', N'Carrera 7 #89-10, Ciudad C', N'3003456789')
INSERT [dbo].[CLIENTE] ([Documento], [Nombre], [Direccion], [NumeroCelular]) VALUES (4040404, N'María López', N'Calle 8 #12-34, Ciudad D', N'3004567890')
INSERT [dbo].[CLIENTE] ([Documento], [Nombre], [Direccion], [NumeroCelular]) VALUES (5050505, N'Jorge Ramírez', N'Av. La Paz 567, Ciudad E', N'3005678901')
GO
INSERT [dbo].[DETALLE_FACTURA_COMPRA] ([NumeroFacturaCompra], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (1, 1, 10, NULL)
INSERT [dbo].[DETALLE_FACTURA_COMPRA] ([NumeroFacturaCompra], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (1, 2, 5, NULL)
INSERT [dbo].[DETALLE_FACTURA_COMPRA] ([NumeroFacturaCompra], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (2, 3, 8, NULL)
INSERT [dbo].[DETALLE_FACTURA_COMPRA] ([NumeroFacturaCompra], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (2, 4, 12, NULL)
INSERT [dbo].[DETALLE_FACTURA_COMPRA] ([NumeroFacturaCompra], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (2, 5, 7, NULL)
GO
INSERT [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (1, 1, 2, NULL)
INSERT [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (1, 2, 1, NULL)
INSERT [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (2, 3, 3, NULL)
INSERT [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (2, 4, 1, NULL)
INSERT [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto], [Cantidad], [Subtotal]) VALUES (3, 5, 5, NULL)
GO
INSERT [dbo].[EMPLEADO] ([Documento], [CodigoCargo], [Nombre], [Direccion], [NumeroCelular], [FechaNacimiento]) VALUES (101, 1, N'Juan Pérez', N'Calle Ficticia 123', N'3001234567', CAST(N'1985-05-10' AS Date))
INSERT [dbo].[EMPLEADO] ([Documento], [CodigoCargo], [Nombre], [Direccion], [NumeroCelular], [FechaNacimiento]) VALUES (102, 2, N'María López', N'Calle Real 456', N'3002345678', CAST(N'1990-07-15' AS Date))
INSERT [dbo].[EMPLEADO] ([Documento], [CodigoCargo], [Nombre], [Direccion], [NumeroCelular], [FechaNacimiento]) VALUES (103, 3, N'Carlos Gómez', N'Avenida Central 789', N'3003456789', CAST(N'1982-02-20' AS Date))
INSERT [dbo].[EMPLEADO] ([Documento], [CodigoCargo], [Nombre], [Direccion], [NumeroCelular], [FechaNacimiento]) VALUES (104, 4, N'Ana Torres', N'Calle Luna 101', N'3004567890', CAST(N'1995-09-25' AS Date))
INSERT [dbo].[EMPLEADO] ([Documento], [CodigoCargo], [Nombre], [Direccion], [NumeroCelular], [FechaNacimiento]) VALUES (105, 5, N'Luis Martínez', N'Calle Sol 202', N'3005678901', CAST(N'1998-12-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[FACTURA_COMPRA] ON 

INSERT [dbo].[FACTURA_COMPRA] ([Numero], [NITProveedor], [DocumentoEmpleado], [TotalVenta], [Fecha]) VALUES (1, 123456789, 101, NULL, CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_COMPRA] ([Numero], [NITProveedor], [DocumentoEmpleado], [TotalVenta], [Fecha]) VALUES (2, 987654321, 102, NULL, CAST(N'2024-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_COMPRA] ([Numero], [NITProveedor], [DocumentoEmpleado], [TotalVenta], [Fecha]) VALUES (3, 135792468, 103, NULL, CAST(N'2024-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_COMPRA] ([Numero], [NITProveedor], [DocumentoEmpleado], [TotalVenta], [Fecha]) VALUES (4, 246813579, 104, NULL, CAST(N'2024-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_COMPRA] ([Numero], [NITProveedor], [DocumentoEmpleado], [TotalVenta], [Fecha]) VALUES (5, 864209753, 105, NULL, CAST(N'2024-11-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[FACTURA_COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[FACTURA_VENTA] ON 

INSERT [dbo].[FACTURA_VENTA] ([Numero], [DocumentoCliente], [NumeroCajaRegistradora], [Total], [Fecha]) VALUES (1, 1010101, 1, NULL, CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_VENTA] ([Numero], [DocumentoCliente], [NumeroCajaRegistradora], [Total], [Fecha]) VALUES (2, 2020202, 2, NULL, CAST(N'2024-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_VENTA] ([Numero], [DocumentoCliente], [NumeroCajaRegistradora], [Total], [Fecha]) VALUES (3, 3030303, 3, NULL, CAST(N'2024-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_VENTA] ([Numero], [DocumentoCliente], [NumeroCajaRegistradora], [Total], [Fecha]) VALUES (4, 4040404, 1, NULL, CAST(N'2024-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA_VENTA] ([Numero], [DocumentoCliente], [NumeroCajaRegistradora], [Total], [Fecha]) VALUES (5, 5050505, 2, NULL, CAST(N'2024-11-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[FACTURA_VENTA] OFF
GO
SET IDENTITY_INSERT [dbo].[OPERACION_CAJA] ON 

INSERT [dbo].[OPERACION_CAJA] ([Codigo], [NumeroCajaRegistradora], [ValorBase], [ValorCierre], [Fecha]) VALUES (5, 1, CAST(100.00 AS Decimal(10, 2)), CAST(150.50 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
INSERT [dbo].[OPERACION_CAJA] ([Codigo], [NumeroCajaRegistradora], [ValorBase], [ValorCierre], [Fecha]) VALUES (6, 2, CAST(200.00 AS Decimal(10, 2)), CAST(250.75 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
INSERT [dbo].[OPERACION_CAJA] ([Codigo], [NumeroCajaRegistradora], [ValorBase], [ValorCierre], [Fecha]) VALUES (7, 3, CAST(150.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
INSERT [dbo].[OPERACION_CAJA] ([Codigo], [NumeroCajaRegistradora], [ValorBase], [ValorCierre], [Fecha]) VALUES (8, 4, CAST(120.00 AS Decimal(10, 2)), CAST(130.25 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
INSERT [dbo].[OPERACION_CAJA] ([Codigo], [NumeroCajaRegistradora], [ValorBase], [ValorCierre], [Fecha]) VALUES (9, 5, CAST(300.00 AS Decimal(10, 2)), CAST(320.00 AS Decimal(10, 2)), CAST(N'2024-11-10' AS Date))
SET IDENTITY_INSERT [dbo].[OPERACION_CAJA] OFF
GO
SET IDENTITY_INSERT [dbo].[PAGINA] ON 

INSERT [dbo].[PAGINA] ([Codigo], [Titulo], [URL]) VALUES (1, N'Página de Inicio', N'https://www.ejemplo1.com')
INSERT [dbo].[PAGINA] ([Codigo], [Titulo], [URL]) VALUES (2, N'Página de Productos', N'https://www.ejemplo2.com')
INSERT [dbo].[PAGINA] ([Codigo], [Titulo], [URL]) VALUES (3, N'Página de Servicios', N'https://www.ejemplo3.com')
INSERT [dbo].[PAGINA] ([Codigo], [Titulo], [URL]) VALUES (4, N'Página de Contacto', N'https://www.ejemplo4.com')
INSERT [dbo].[PAGINA] ([Codigo], [Titulo], [URL]) VALUES (5, N'Página de Blog', N'https://www.ejemplo5.com')
SET IDENTITY_INSERT [dbo].[PAGINA] OFF
GO
INSERT [dbo].[PAGINA_PERFIL] ([CodigoPagina], [IdPerfil]) VALUES (1, 1)
INSERT [dbo].[PAGINA_PERFIL] ([CodigoPagina], [IdPerfil]) VALUES (2, 2)
INSERT [dbo].[PAGINA_PERFIL] ([CodigoPagina], [IdPerfil]) VALUES (3, 3)
INSERT [dbo].[PAGINA_PERFIL] ([CodigoPagina], [IdPerfil]) VALUES (4, 4)
INSERT [dbo].[PAGINA_PERFIL] ([CodigoPagina], [IdPerfil]) VALUES (5, 5)
GO
SET IDENTITY_INSERT [dbo].[PERFIL] ON 

INSERT [dbo].[PERFIL] ([Id], [Nombre], [Descripcion]) VALUES (1, N'Administrador', N'Acceso completo a todas las funcionalidades del sistema')
INSERT [dbo].[PERFIL] ([Id], [Nombre], [Descripcion]) VALUES (2, N'Vendedor', N'Acceso a la gestión de ventas y productos')
INSERT [dbo].[PERFIL] ([Id], [Nombre], [Descripcion]) VALUES (3, N'Gerente', N'Acceso a reportes y gestión de empleados')
INSERT [dbo].[PERFIL] ([Id], [Nombre], [Descripcion]) VALUES (4, N'Soporte', N'Acceso limitado para la atención de clientes')
INSERT [dbo].[PERFIL] ([Id], [Nombre], [Descripcion]) VALUES (5, N'Contabilidad', N'Acceso a la gestión financiera y facturación')
SET IDENTITY_INSERT [dbo].[PERFIL] OFF
GO
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (1, 1, N'Smartphone', 50, N'Teléfono inteligente con pantalla de 6.5 pulgadas', CAST(499.99 AS Decimal(10, 2)), CAST(450.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (2, 1, N'Laptop', 30, N'Laptop con procesador Intel Core i5 y 8GB de RAM', CAST(799.99 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (3, 2, N'Aspiradora', 15, N'Aspiradora portátil con alta potencia de succión', CAST(120.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (4, 2, N'Microondas', 20, N'Microondas digital de 20 litros', CAST(89.99 AS Decimal(10, 2)), CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (5, 3, N'Camiseta', 200, N'Camiseta de algodón 100%', CAST(12.99 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (6, 3, N'Jeans', 150, N'Jeans de mezclilla para hombre', CAST(29.99 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (7, 4, N'Galletas', 100, N'Paquete de galletas de chocolate', CAST(2.50 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (8, 4, N'Cereal', 80, N'Cereal integral de maíz', CAST(3.50 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (9, 5, N'Muñeca', 60, N'Muñeca de juguete con accesorios', CAST(15.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[PRODUCTO] ([Codigo], [CodigoCategoria], [Nombre], [Stock], [Descripcion], [PrecioPublico], [PrecioProveedor]) VALUES (10, 5, N'Pelota', 90, N'Pelota de fútbol para niños', CAST(10.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[PROVEEDOR] ([NIT], [Nombre], [RazonSocial], [NumeroCelular], [Direccion]) VALUES (123456789, N'Proveedor A', N'Proveedor A S.A.', N'3001234567', N'Calle 123, Ciudad A')
INSERT [dbo].[PROVEEDOR] ([NIT], [Nombre], [RazonSocial], [NumeroCelular], [Direccion]) VALUES (135792468, N'Proveedor C', N'Proveedor C S.A.', N'3003456789', N'Carrera 789, Ciudad C')
INSERT [dbo].[PROVEEDOR] ([NIT], [Nombre], [RazonSocial], [NumeroCelular], [Direccion]) VALUES (246813579, N'Proveedor D', N'Proveedor D S.A.', N'3004567890', N'Boulevard 012, Ciudad D')
INSERT [dbo].[PROVEEDOR] ([NIT], [Nombre], [RazonSocial], [NumeroCelular], [Direccion]) VALUES (864209753, N'Proveedor E', N'Proveedor E S.A.', N'3005678901', N'Ruta 345, Ciudad E')
INSERT [dbo].[PROVEEDOR] ([NIT], [Nombre], [RazonSocial], [NumeroCelular], [Direccion]) VALUES (987654321, N'Proveedor B', N'Proveedor B S.A.', N'3002345678', N'Avenida 456, Ciudad B')
GO
SET IDENTITY_INSERT [dbo].[TURNO] ON 

INSERT [dbo].[TURNO] ([Codigo], [DocumentoEmpleado], [NumeroCajaRegistradora], [Ingreso], [Salida]) VALUES (1, 101, 1, CAST(N'2024-11-10T08:00:00.000' AS DateTime), CAST(N'2024-11-10T16:00:00.000' AS DateTime))
INSERT [dbo].[TURNO] ([Codigo], [DocumentoEmpleado], [NumeroCajaRegistradora], [Ingreso], [Salida]) VALUES (2, 102, 2, CAST(N'2024-11-10T09:00:00.000' AS DateTime), CAST(N'2024-11-10T17:00:00.000' AS DateTime))
INSERT [dbo].[TURNO] ([Codigo], [DocumentoEmpleado], [NumeroCajaRegistradora], [Ingreso], [Salida]) VALUES (3, 103, 3, CAST(N'2024-11-10T10:00:00.000' AS DateTime), CAST(N'2024-11-10T18:00:00.000' AS DateTime))
INSERT [dbo].[TURNO] ([Codigo], [DocumentoEmpleado], [NumeroCajaRegistradora], [Ingreso], [Salida]) VALUES (4, 104, 4, CAST(N'2024-11-10T11:00:00.000' AS DateTime), CAST(N'2024-11-10T19:00:00.000' AS DateTime))
INSERT [dbo].[TURNO] ([Codigo], [DocumentoEmpleado], [NumeroCajaRegistradora], [Ingreso], [Salida]) VALUES (5, 105, 5, CAST(N'2024-11-10T12:00:00.000' AS DateTime), CAST(N'2024-11-10T20:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TURNO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([Id], [DocumentoEmpleado], [Nombre], [Clave], [Salt]) VALUES (1, 101, N'Juan Pérez', N'clave123', N'saltA1')
INSERT [dbo].[USUARIO] ([Id], [DocumentoEmpleado], [Nombre], [Clave], [Salt]) VALUES (2, 102, N'María López', N'clave234', N'saltB2')
INSERT [dbo].[USUARIO] ([Id], [DocumentoEmpleado], [Nombre], [Clave], [Salt]) VALUES (3, 103, N'Carlos Gómez', N'clave345', N'saltC3')
INSERT [dbo].[USUARIO] ([Id], [DocumentoEmpleado], [Nombre], [Clave], [Salt]) VALUES (4, 104, N'Ana Torres', N'clave456', N'saltD4')
INSERT [dbo].[USUARIO] ([Id], [DocumentoEmpleado], [Nombre], [Clave], [Salt]) VALUES (5, 105, N'Luis Martínez', N'clave567', N'saltE5')
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
INSERT [dbo].[USUARIO_PERFIL] ([IdPerfil], [IdUsuario], [Activo]) VALUES (1, 1, 1)
INSERT [dbo].[USUARIO_PERFIL] ([IdPerfil], [IdUsuario], [Activo]) VALUES (2, 2, 1)
INSERT [dbo].[USUARIO_PERFIL] ([IdPerfil], [IdUsuario], [Activo]) VALUES (3, 3, 0)
INSERT [dbo].[USUARIO_PERFIL] ([IdPerfil], [IdUsuario], [Activo]) VALUES (4, 4, 1)
INSERT [dbo].[USUARIO_PERFIL] ([IdPerfil], [IdUsuario], [Activo]) VALUES (5, 5, 0)
GO
/****** Object:  Index [idx_ingreso]    Script Date: 11/11/2024 11:21:29 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_ingreso] ON [dbo].[TURNO]
(
	[Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_salida]    Script Date: 11/11/2024 11:21:29 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_salida] ON [dbo].[TURNO]
(
	[Salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DETALLE_FACTURA_COMPRA]  WITH CHECK ADD FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[PRODUCTO] ([Codigo])
GO
ALTER TABLE [dbo].[DETALLE_FACTURA_COMPRA]  WITH CHECK ADD FOREIGN KEY([NumeroFacturaCompra])
REFERENCES [dbo].[FACTURA_COMPRA] ([Numero])
GO
ALTER TABLE [dbo].[DETALLE_FACTURA_VENTA]  WITH CHECK ADD FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[PRODUCTO] ([Codigo])
GO
ALTER TABLE [dbo].[DETALLE_FACTURA_VENTA]  WITH CHECK ADD FOREIGN KEY([NumeroFactura])
REFERENCES [dbo].[FACTURA_VENTA] ([Numero])
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD FOREIGN KEY([CodigoCargo])
REFERENCES [dbo].[CARGO] ([Codigo])
GO
ALTER TABLE [dbo].[FACTURA_COMPRA]  WITH CHECK ADD FOREIGN KEY([DocumentoEmpleado])
REFERENCES [dbo].[EMPLEADO] ([Documento])
GO
ALTER TABLE [dbo].[FACTURA_COMPRA]  WITH CHECK ADD FOREIGN KEY([NITProveedor])
REFERENCES [dbo].[PROVEEDOR] ([NIT])
GO
ALTER TABLE [dbo].[FACTURA_VENTA]  WITH CHECK ADD FOREIGN KEY([DocumentoCliente])
REFERENCES [dbo].[CLIENTE] ([Documento])
GO
ALTER TABLE [dbo].[FACTURA_VENTA]  WITH CHECK ADD FOREIGN KEY([NumeroCajaRegistradora])
REFERENCES [dbo].[CAJA_REGISTRADORA] ([Numero])
GO
ALTER TABLE [dbo].[OPERACION_CAJA]  WITH CHECK ADD FOREIGN KEY([NumeroCajaRegistradora])
REFERENCES [dbo].[CAJA_REGISTRADORA] ([Numero])
GO
ALTER TABLE [dbo].[PAGINA_PERFIL]  WITH CHECK ADD FOREIGN KEY([CodigoPagina])
REFERENCES [dbo].[PAGINA] ([Codigo])
GO
ALTER TABLE [dbo].[PAGINA_PERFIL]  WITH CHECK ADD FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[PERFIL] ([Id])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[CATEGORIA] ([Codigo])
GO
ALTER TABLE [dbo].[REPORTE]  WITH CHECK ADD FOREIGN KEY([CodigoPeriodo])
REFERENCES [dbo].[PERIODO] ([Codigo])
GO
ALTER TABLE [dbo].[REPORTE_COMPRAS]  WITH CHECK ADD FOREIGN KEY([NumeroReporte])
REFERENCES [dbo].[REPORTE] ([Numero])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_COMPRAS]  WITH CHECK ADD FOREIGN KEY([NumeroFacturaCompra])
REFERENCES [dbo].[FACTURA_COMPRA] ([Numero])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_COMPRAS]  WITH CHECK ADD FOREIGN KEY([NumeroReporteCompras])
REFERENCES [dbo].[REPORTE_COMPRAS] ([NumeroReporte])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_ROTACION]  WITH CHECK ADD FOREIGN KEY([NumeroReporteRotacion])
REFERENCES [dbo].[REPORTE_ROTACION] ([NumeroReporte])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_ROTACION]  WITH CHECK ADD FOREIGN KEY([CodigoProducto], [NumeroFactura])
REFERENCES [dbo].[DETALLE_FACTURA_VENTA] ([NumeroFactura], [CodigoProducto])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_VENTAS]  WITH CHECK ADD FOREIGN KEY([NumeroFactura])
REFERENCES [dbo].[FACTURA_VENTA] ([Numero])
GO
ALTER TABLE [dbo].[REPORTE_FACTURA_VENTAS]  WITH CHECK ADD FOREIGN KEY([NumeroReporteVentas])
REFERENCES [dbo].[REPORTE_VENTAS] ([NumeroReporte])
GO
ALTER TABLE [dbo].[REPORTE_ROTACION]  WITH CHECK ADD FOREIGN KEY([NumeroReporte])
REFERENCES [dbo].[REPORTE] ([Numero])
GO
ALTER TABLE [dbo].[REPORTE_VENTAS]  WITH CHECK ADD FOREIGN KEY([NumeroReporte])
REFERENCES [dbo].[REPORTE] ([Numero])
GO
ALTER TABLE [dbo].[TURNO]  WITH CHECK ADD FOREIGN KEY([DocumentoEmpleado])
REFERENCES [dbo].[EMPLEADO] ([Documento])
GO
ALTER TABLE [dbo].[TURNO]  WITH CHECK ADD FOREIGN KEY([NumeroCajaRegistradora])
REFERENCES [dbo].[CAJA_REGISTRADORA] ([Numero])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([DocumentoEmpleado])
REFERENCES [dbo].[EMPLEADO] ([Documento])
GO
ALTER TABLE [dbo].[USUARIO_PERFIL]  WITH CHECK ADD FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[PERFIL] ([Id])
GO
ALTER TABLE [dbo].[USUARIO_PERFIL]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([Id])
GO
USE [master]
GO
ALTER DATABASE [DBSuper_DJYM] SET  READ_WRITE 
GO
