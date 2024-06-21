-- Agregar datos a la tabla 'paises'
INSERT INTO paises (idpais, nombre) VALUES 
('PA01', 'Colombia'), 
('PA02', 'Mexico'), 
('PA03', 'España'), 
('PA04', 'Japon'), 
('PA05', 'Chile');

-- Agregar datos a la tabla 'ciudades'
INSERT INTO ciudades (idciudades, nombre, idpais) VALUES 
('C01', 'Bucaramanga', 'PA01'), 
('C02', 'Monterrey', 'PA02'), 
('C03', 'Barcelona', 'PA03'), 
('C04', 'Tokio', 'PA04'), 
('C05', 'Santiago de Chile', 'PA05');

-- Agregar datos a la tabla 'sucursales'
INSERT INTO sucursales (direccion, idciudades) VALUES 
('Direccion 1', 'C01'), 
('Direccion 2', 'C02'), 
('Direccion 3', 'C03'), 
('Direccion 4', 'C04'), 
('Direccion 5', 'C05');

-- Agregar datos a la tabla 'marcas'
INSERT INTO marcas (nombre) VALUES 
('Toyota'), 
('Ford');

-- Agregar datos a la tabla 'modelos'
INSERT INTO modelos (nombre, idmarca) VALUES 
('Corolla', 1), 
('Camry', 1), 
('Mustang', 2), 
('Fiesta', 2);

-- Agregar datos a la tabla 'vehiculos'
INSERT INTO vehiculos (placa, Capacidadcarga, idmodelo, idsucursal) VALUES 
('ABC123', 1000.50, 1, 1), 
('DEF456', 1500.75, 2, 2), 
('GHI789', 2000.00, 3, 3), 
('JKL012', 2500.25, 4, 4), 
('MNO345', 3000.50, 4, 5);

-- Agregar datos a la tabla 'tipodocumentos'
INSERT INTO tipodocumentos (nombre) VALUES 
('DNI'), 
('Pasaporte'), 
('Licencia'), 
('Tarjeta de Identidad'), 
('Permiso de Residencia');

-- Agregar datos a la tabla 'conductores'
INSERT INTO conductores (idconductor, nombre, idtipdoc) VALUES 
(1, 'Conductor A', 1), 
(2, 'Conductor B', 2), 
(3, 'Conductor C', 3), 
(4, 'Conductor D', 4), 
(5, 'Conductor E', 5);

-- Agregar datos a la tabla 'rutas'
INSERT INTO rutas (sucursalid, descripcion) VALUES 
(1, 'Ruta 1 Descripcion'), 
(2, 'Ruta 2 Descripcion'), 
(3, 'Ruta 3 Descripcion'), 
(4, 'Ruta 4 Descripcion'), 
(5, 'Ruta 5 Descripcion');

-- Agregar datos a la tabla 'rutasconductor'
INSERT INTO rutasconductor (conductorid, rutaid, placa, idsucursal) VALUES 
(1, 1, 'ABC123', 1), 
(2, 2, 'DEF456', 2), 
(3, 3, 'GHI789', 3), 
(4, 4, 'JKL012', 4), 
(5, 5, 'MNO345', 5);

-- Agregar datos a la tabla 'estados'
INSERT INTO estados (nombre) VALUES 
('En Tránsito'), 
('Entregado'), 
('Retenido en aduana'),
('Recibido');

-- Agregar datos a la tabla 'tiposervicios'
INSERT INTO tiposervicios (nombre) VALUES 
('Express'), 
('Standard'), 
('Economy'), 
('Premium'), 
('Same Day');

-- Agregar datos a la tabla 'paquetes'
INSERT INTO paquetes (idseguimiento, peso, dimenciones, contenido, valordeclarado, idtiposervicio, idestado) VALUES 
(1, 5.50, '10x10x10', 'Documento', 100.00, 1, 1), 
(2, 15.75, '20x20x20', 'Paquete', 200.00, 2, 2), 
(3, 25.25, '30x30x30', 'Regalo', 300.00, 3, 3), 
(4, 35.50, '40x40x40', 'Electrónica', 400.00, 4, 4), 
(5, 45.75, '50x50x50', 'Ropa', 500.00, 5, 4);

-- Agregar datos a la tabla 'seguimientos'
INSERT INTO seguimientos (idpaquete, ubicacion, fechahora) VALUES
(1, 'Ubicación 1', '2024-06-20 10:00:00'),
(2, 'Ubicación 2', '2024-06-21 12:00:00'),
(3, 'Ubicación 3', '2024-06-22 14:00:00'),
(4, 'Ubicación 4', '2024-06-23 16:00:00'),
(5, 'Ubicación 5', '2024-06-24 18:00:00');


-- Agregar datos a la tabla 'clientes'
INSERT INTO clientes (idcliente, nombre, correo, direccion, idtipdoc) VALUES 
(1, 'Cliente A', 'clienteA@example.com', 'Direccion Cliente A', 1), 
(2, 'Cliente B', 'clienteB@example.com', 'Direccion Cliente B', 2), 
(3, 'Cliente C', 'clienteC@example.com', 'Direccion Cliente C', 3), 
(4, 'Cliente D', 'clienteD@example.com', 'Direccion Cliente D', 4), 
(5, 'Cliente E', 'clienteE@example.com', 'Direccion Cliente E', 5);

-- Agregar datos a la tabla 'auxiliares'
INSERT INTO auxiliares (idauxiliares, nombre, telefono, idtipdoc) VALUES 
(1, 'Auxiliar A', '555123456', 1), 
(2, 'Auxiliar B', '555789012', 2), 
(3, 'Auxiliar C', '555345678', 3), 
(4, 'Auxiliar D', '555901234', 4), 
(5, 'Auxiliar E', '555567890', 5);

-- Agregar datos a la tabla 'envios'
INSERT INTO envios (idcliente, idpaquete, idsucursal, idrutas, fehaenvio, destino) VALUES 
(1, 1, 1, 1, '2024-06-20 10:00:00', 'Destino A'), 
(2, 2, 2, 2, '2024-06-21 12:00:00', 'Destino B'), 
(3, 3, 3, 3, '2024-06-22 14:00:00', 'Destino C'), 
(4, 4, 4, 4, '2024-06-23 16:00:00', 'Destino D'), 
(5, 5, 5, 5, '2024-06-24 18:00:00', 'Destino E');


-- ignorar
INSERT INTO envios (idcliente, idpaquete, idsucursal, idrutas, fehaenvio, destino) VALUES 
(1, 11, 1, 1, '2024-06-20 10:00:00', 'Destino A'), 
(2, 12, 2, 2, '2024-06-21 12:00:00', 'Destino B'), 
(3, 13, 3, 3, '2024-06-22 14:00:00', 'Destino C'), 
(4, 14, 4, 4, '2024-06-23 16:00:00', 'Destino D'), 
(5, 15, 5, 5, '2024-06-24 18:00:00', 'Destino E');
-- Agregar datos a la tabla 'rutasauxiliares'
INSERT INTO rutasauxiliares (rutaid, idauxiliar) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5);

-- Agregar datos a la tabla 'telconductores'
INSERT INTO telconductores (numero, idconductor) VALUES 
('555123456', 1), 
('555789012', 2), 
('555345678', 3), 
('555901234', 4), 
('555567890', 5);

-- Agregar datos a la tabla 'telclientes'
INSERT INTO telclientes (numero, idcliente) VALUES 
('555654321', 1), 
('555987654', 2), 
('555321654', 3), 
('555654987', 4), 
('555789123', 5);

