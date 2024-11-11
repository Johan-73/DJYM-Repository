INSERT INTO PAGINA (Titulo, URL)
VALUES
('Página de Inicio', 'https://www.ejemplo1.com'),
('Página de Productos', 'https://www.ejemplo2.com'),
('Página de Servicios', 'https://www.ejemplo3.com'),
('Página de Contacto', 'https://www.ejemplo4.com'),
('Página de Blog', 'https://www.ejemplo5.com');

INSERT INTO PERFIL (Nombre, Descripcion)
VALUES
('Administrador', 'Acceso completo a todas las funcionalidades del sistema'),
('Vendedor', 'Acceso a la gestión de ventas y productos'),
('Gerente', 'Acceso a reportes y gestión de empleados'),
('Soporte', 'Acceso limitado para la atención de clientes'),
('Contabilidad', 'Acceso a la gestión financiera y facturación');

INSERT INTO PAGINA_PERFIL (CodigoPagina, IdPerfil)
VALUES
(1, 1),  -- Página de Inicio con Perfil de Administrador
(2, 2),  -- Página de Productos con Perfil de Vendedor
(3, 3),  -- Página de Servicios con Perfil de Gerente
(4, 4),  -- Página de Contacto con Perfil de Soporte
(5, 5);  -- Página de Blog con Perfil de Contabilidad

INSERT INTO CARGO (Descripcion, Saldo)
VALUES
('Gerente', 5000000.00),
('Vendedor', 2000000.00),
('Contador', 3000000.00),
('Soporte Técnico', 1500000.00),
('Administrador', 4000000.00);

INSERT INTO EMPLEADO (Documento, CodigoCargo, Nombre, Direccion, NumeroCelular, FechaNacimiento)
VALUES
(101, 1, 'Juan Pérez', 'Calle Ficticia 123', '3001234567', '1985-05-10'),
(102, 2, 'María López', 'Calle Real 456', '3002345678', '1990-07-15'),
(103, 3, 'Carlos Gómez', 'Avenida Central 789', '3003456789', '1982-02-20'),
(104, 4, 'Ana Torres', 'Calle Luna 101', '3004567890', '1995-09-25'),
(105, 5, 'Luis Martínez', 'Calle Sol 202', '3005678901', '1998-12-30');

INSERT INTO USUARIO (DocumentoEmpleado, Nombre, Clave, Salt)
VALUES
(101, 'Juan Pérez', 'clave123', 'saltA1'),
(102, 'María López', 'clave234', 'saltB2'),
(103, 'Carlos Gómez', 'clave345', 'saltC3'),
(104, 'Ana Torres', 'clave456', 'saltD4'),
(105, 'Luis Martínez', 'clave567', 'saltE5');

INSERT INTO USUARIO_PERFIL (IdPerfil, IdUsuario, Activo)
VALUES
(1, 1, 1),  -- Perfil de Administrador para Juan Pérez (activo)
(2, 2, 1),  -- Perfil de Vendedor para María López (activo)
(3, 3, 0),  -- Perfil de Contador para Carlos Gómez (inactivo)
(4, 4, 1),  -- Perfil de Soporte Técnico para Ana Torres (activo)
(5, 5, 0);  -- Perfil de Contabilidad para Luis Martínez (inactivo)

INSERT INTO CAJA_REGISTRADORA (Numero, Marca, Descripcion)
VALUES
(1, 'Casio', 'Caja registradora de uso general'),
(2, 'Sharp', 'Caja registradora para supermercado'),
(3, 'Samsung', 'Caja registradora con pantalla táctil'),
(4, 'OLivetti', 'Caja registradora con impresora integrada'),
(5, 'Epson', 'Caja registradora para tienda de ropa');

INSERT INTO TURNO (DocumentoEmpleado, NumeroCajaRegistradora, Ingreso, Salida)
VALUES
(101, 1, '2024-11-10 08:00:00', '2024-11-10 16:00:00'),
(102, 2, '2024-11-10 09:00:00', '2024-11-10 17:00:00'),
(103, 3, '2024-11-10 10:00:00', '2024-11-10 18:00:00'),
(104, 4, '2024-11-10 11:00:00', '2024-11-10 19:00:00'),
(105, 5, '2024-11-10 12:00:00', '2024-11-10 20:00:00');

INSERT INTO OPERACION_CAJA (NumeroCajaRegistradora, ValorBase, ValorCierre, Fecha)
VALUES
(1, 100.00, 150.50, '2024-11-10'),
(2, 200.00, 250.75, '2024-11-10'),
(3, 150.00, 180.00, '2024-11-10'),
(4, 120.00, 130.25, '2024-11-10'),
(5, 300.00, 320.00, '2024-11-10');


INSERT INTO CLIENTE (Documento, Nombre, Direccion, NumeroCelular)
VALUES
(1010101, 'Carlos Pérez', 'Av. Principal 123, Ciudad A', '3001234567'),
(2020202, 'Ana Martínez', 'Calle Secundaria 456, Ciudad B', '3002345678'),
(3030303, 'Luis Gómez', 'Carrera 7 #89-10, Ciudad C', '3003456789'),
(4040404, 'María López', 'Calle 8 #12-34, Ciudad D', '3004567890'),
(5050505, 'Jorge Ramírez', 'Av. La Paz 567, Ciudad E', '3005678901');

INSERT INTO FACTURA_VENTA (DocumentoCliente, NumeroCajaRegistradora, Total, Fecha)
VALUES
(1010101, 1, NULL, '2024-11-01'),
(2020202, 2, NULL, '2024-11-02'),
(3030303, 3, NULL, '2024-11-03'),
(4040404, 1, NULL, '2024-11-04'),
(5050505, 2, NULL, '2024-11-05');

INSERT INTO CATEGORIA (Nombre, Descripcion)
VALUES
('Electrónica', 'Productos de electrónica y tecnología'),
('Hogar', 'Artículos para el hogar y la cocina'),
('Ropa', 'Prendas de vestir y accesorios'),
('Alimentos', 'Productos de consumo alimenticio'),
('Juguetes', 'Juguetes y artículos de entretenimiento para niños');

INSERT INTO PRODUCTO (Codigo, CodigoCategoria, Nombre, Stock, Descripcion, PrecioPublico, PrecioProveedor)
VALUES
(1, 1, 'Smartphone', 50, 'Teléfono inteligente con pantalla de 6.5 pulgadas', 499.99, 450.00),
(2, 1, 'Laptop', 30, 'Laptop con procesador Intel Core i5 y 8GB de RAM', 799.99, 720.00),
(3, 2, 'Aspiradora', 15, 'Aspiradora portátil con alta potencia de succión', 120.00, 100.00),
(4, 2, 'Microondas', 20, 'Microondas digital de 20 litros', 89.99, 75.00),
(5, 3, 'Camiseta', 200, 'Camiseta de algodón 100%', 12.99, 8.00),
(6, 3, 'Jeans', 150, 'Jeans de mezclilla para hombre', 29.99, 20.00),
(7, 4, 'Galletas', 100, 'Paquete de galletas de chocolate', 2.50, 1.80),
(8, 4, 'Cereal', 80, 'Cereal integral de maíz', 3.50, 2.50),
(9, 5, 'Muñeca', 60, 'Muñeca de juguete con accesorios', 15.00, 10.00),
(10, 5, 'Pelota', 90, 'Pelota de fútbol para niños', 10.00, 7.50);

INSERT INTO DETALLE_FACTURA_VENTA (NumeroFactura, CodigoProducto, Cantidad, Subtotal)
VALUES
(1, 1, 2, NULL),
(1, 2, 1, NULL),
(2, 3, 3, NULL),
(2, 4, 1, NULL),
(3, 5, 5, NULL);

INSERT INTO PROVEEDOR (NIT, Nombre, RazonSocial, NumeroCelular, Direccion)
VALUES
(123456789, 'Proveedor A', 'Proveedor A S.A.', '3001234567', 'Calle 123, Ciudad A'),
(987654321, 'Proveedor B', 'Proveedor B S.A.', '3002345678', 'Avenida 456, Ciudad B'),
(135792468, 'Proveedor C', 'Proveedor C S.A.', '3003456789', 'Carrera 789, Ciudad C'),
(246813579, 'Proveedor D', 'Proveedor D S.A.', '3004567890', 'Boulevard 012, Ciudad D'),
(864209753, 'Proveedor E', 'Proveedor E S.A.', '3005678901', 'Ruta 345, Ciudad E');

INSERT INTO FACTURA_COMPRA (NITProveedor, DocumentoEmpleado, TotalVenta, Fecha)
VALUES
(123456789, 101, NULL, '2024-11-01'),
(987654321, 102, NULL, '2024-11-02'),
(135792468, 103, NULL, '2024-11-03'),
(246813579, 104, NULL, '2024-11-04'),
(864209753, 105, NULL, '2024-11-05');

INSERT INTO DETALLE_FACTURA_COMPRA (NumeroFacturaCompra, CodigoProducto, Cantidad, Subtotal)
VALUES
(1, 1, 10, NULL),
(1, 2, 5, NULL),
(2, 3, 8, NULL),
(2, 4, 12, NULL),
(2, 5, 7, NULL);







