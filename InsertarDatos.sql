-- --------------------------------------- CALLES ---------------------------------------
INSERT INTO calle(nombre, figuraCl) VALUES
	-- Calles Verticales
	('CalleA', 'LINESTRING(-0.25 0, -0.25 3, -0.25 6, -0.25 9.5)'),
	('CalleB', 'LINESTRING(1.5 0, 1.5 3, 1.5 6, 1.5 9.5)'),
	('CalleC','LINESTRING(5.5 0, 5.5 3, 5.5 6, 5.5 9.5)'),
	('CalleD','LINESTRING(7.5 0, 7.5 3, 7.5 6, 7.5 9.5)'),
	('CalleE', 'LINESTRING(10.5 0, 10.5 3, 10.5 6, 10.5 9.5)'),
	-- Calles Horizontales
	('Calle1', 'LINESTRING(0 9.5, 3 9.5, 6 9.5, 10 9.5)'),
	('Calle2', 'LINESTRING(0 7.5, 3 7.5, 6 7.5, 10 7.5)'),
	('Calle3', 'LINESTRING(0 5.5, 3 5.5, 6 5.5, 10 5.5)'),
	('Calle4', 'LINESTRING(0 3.5, 3 3.5, 6 3.5, 10 3.5)'),
	('Calle5', 'LINESTRING(0 1.5, 3 1.5, 6 1.5, 10 1.5)'),
	('Calle6', 'LINESTRING(0 -0.5, 3 -0.5, 6 -0.5, 10 -0.5)');
-- SELECT * FROM calle;

-- --------------------------------------- CASAS ---------------------------------------
INSERT INTO casa(numero, figuraCs) VALUES
	('Casa#1-A', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
	('Casa#2-A', 'POLYGON((3 0, 4 0, 4 1, 3 1, 3 0))'),
	('Casa#3-A', 'POLYGON((4 0, 5 0, 5 1, 4 1, 4 0))'),
	('Casa#4-A', 'POLYGON((9 0, 10 0, 10 1, 9 1, 9 0))'),
	('Casa#1-B', 'POLYGON((0 2, 1 2, 1 3, 0 3, 0 2))'),
	('Casa#2-B', 'POLYGON((2 2, 3 2, 3 3, 2 3, 2 2))'),
	('Casa#3-B', 'POLYGON((3 2, 4 2, 4 3, 3 3, 3 2))'),
	('Casa#4-B', 'POLYGON((6 2, 7 2, 7 3, 6 3, 6 2))'),
	('Casa#5-B', 'POLYGON((8 2, 9 2, 9 3, 8 3, 8 2))'),
	('Casa#1-C', 'POLYGON((2 4, 3 4, 3 5, 2 5, 2 4))'),
	('Casa#2-C', 'POLYGON((3 4, 4 4, 4 5, 3 5, 3 4))'),
	('Casa#3-C', 'POLYGON((4 4, 5 4, 5 5, 4 5, 4 4))'),
	('Casa#4-C', 'POLYGON((8 4, 9 4, 9 5, 8 5, 8 4))'),
	('Casa#5-C', 'POLYGON((9 4, 10 4, 10 5, 9 5, 9 4))'),
	('Casa#1-D', 'POLYGON((0 6, 1 6, 1 7, 0 7, 0 6))'),
	('Casa#2-D', 'POLYGON((3 6, 4 6, 4 7, 3 7, 3 6))'),
	('Casa#3-D', 'POLYGON((6 6, 7 6, 7 7, 6 7, 6 6))'),
	('Casa#4-D', 'POLYGON((8 6, 9 6, 9 7, 8 7, 8 6))'),
	('Casa#5-D', 'POLYGON((9 6, 10 6, 10 7, 9 7, 9 6))'),
	('Casa#1-E', 'POLYGON((0 8, 1 8, 1 9, 0 9, 0 8))'),
	('Casa#2-E', 'POLYGON((2 8, 3 8, 3 9, 2 9, 2 8))'),
	('Casa#3-E', 'POLYGON((3 8, 4 8, 4 9, 3 9, 3 8))'),
	('Casa#4-E', 'POLYGON((4 8, 5 8, 5 9, 4 9, 4 8))'),
	('Casa#5-E', 'POLYGON((6 8, 7 8, 7 9, 6 9, 6 8))');

-- SELECT * FROM casa;

-- --------------------------------------- COMERCIOS ---------------------------------------

INSERT INTO tipoComercio(nombre) VALUES
	('restaurante'),
	('farmacia'),
	('panaderia'),
	('carnicería'),
	('supermercado'),
	('libreria');
-- SELECT * FROM tipoComercio;

INSERT INTO comercio(idTipo, numero, abreH, cierraH, figuraCm) VALUES
	(1, 'Comercio#1-A', '13:00:00.0000000', '20:59:59.9999999', 'POLYGON((2 0, 3 0, 3 1, 2 1, 2 0))'),
	(2, 'Comercio#2-A', '9:00:00.0000000', '20:59:59.9999999', 'POLYGON((6 0, 7 0, 7 1, 6 1, 6 0))'),
	(3, 'Comercio#3-A', '7:00:00.0000000', '18:59:59.9999999', 'POLYGON((8 0, 9 0, 9 1, 8 1, 8 0))'),
	(4, 'Comercio#1-B', '8:00:00.0000000', '20:59:59.9999999', 'POLYGON((4 2, 5 2, 5 3, 4 3, 4 2))'),
	(1, 'Comercio#2-B', '12:00:00.0000000','23:59:59.9999999', 'POLYGON((9 2, 10 2, 10 3, 9 3, 9 2))'),
	(5, 'Comercio#1-C', '7:00:00.0000000', '21:59:59.9999999', 'POLYGON((0 4, 1 4, 1 5, 0 5, 0 4))'),
	(3, 'Comercio#2-C', '10:00:00.0000000','18:59:59.9999999', 'POLYGON((6 4, 7 4, 7 5, 6 5, 6 4))'),
	(4, 'Comercio#1-D', '9:00:00.0000000', '23:59:59.9999999', 'POLYGON((2 6, 3 6, 3 7, 2 7, 2 6))'),
	(6, 'Comercio#2-D', '23:00:00.0000000', '16:59:59.9999999', 'POLYGON((4 6, 5 6, 5 7, 4 7, 4 6))'),
	(5, 'Comercio#1-E', '8:30:00.0000000', '21:59:59.9999999', 'POLYGON((8 8, 9 8, 9 9, 8 9, 8 8))'),
	(2, 'Comercio#2-E', '6:00:00.0000000', '20:59:59.9999999', 'POLYGON((9 8, 10 8, 10 9, 9 9, 9 8))');
-- SELECT * FROM comercio;

-- --------------------------------------- PRODUCTOS ---------------------------------------
INSERT INTO tipoProducto(nombre) VALUES
	('pan'),
	('medicamentos'),
	('carnes'),
	('libros'),
	('cuadernos'),
	('lapices'),
	('detergentes'),
	('bebidas'),
	('platos cocinados');
	
-- SELECT * FROM tipoProducto;

INSERT INTO productos(idComercio, idtipoProducto, nombre, precio) VALUES

	-- Productos de restaurantes
	(1, 9, 'Arroz con pollo', 3500),
	(1, 9, 'Pollo a la plancha', 4500),
	(1, 9, 'Fideos', 2500),
	(1, 9, 'Lasaña', 7500),
	(5, 9, 'Salmon', 9500),
	(5, 9, 'Poke', 5500),
	(5, 9, 'Arroz con camarones', 3500),
	(5, 9, 'Canelones', 3000),

	-- Productos de farmacia
	(2, 2, 'cataflam',600),
	(2, 2, 'aspirina', 700),
	(2, 2, 'Paracetamol', 200),
	(2, 2, 'Ramipril', 300),
	(2, 2, 'Omeprazol', 150),
	(11, 2, 'cataflam',500),
	(11, 2, 'aspirina', 900),
	(11, 2, 'Paracetamol', 300),
	(11, 2, 'Ramipril', 100),
	(11, 2, 'Omeprazol', 250),
	
	-- Productos de panaderia
	(3, 1, 'baguette', 1000),
	(3, 1, 'empanada', 500),
	(3, 1, 'arrollado', 600),
	(7, 1, 'baguette', 1000),
	(7, 1, 'brownie', 1100),
	(7, 1, 'pan dulce', 1000),
	
	-- Productos de carniceria
	(4, 3, 'pechuga', 1200),
	(4, 3, 'pavo', 1500),
	(4, 3, 'pescado', 500),
	(8, 3, 'pechuga', 1500),
	(8, 3, 'pavo', 1000),
	(8, 3, 'pescado', 500),
	
	-- Productos de supermercado
	(6, 7, 'para ropa', 1000),
	(6, 7, 'para baño', 3000),
	(6, 8, 'coca cola', 1000),
	(6, 8, 'sprite', 1000),
	(10, 7, 'para ropa', 2000),
	(10, 7, 'para platos', 1200),
	(10, 8, 'coca cola', 900),
	(10, 8, 'sprite', 1100),
	
	-- Productos de libreria
	(9, 4, 'matematica', 10000),
	(9, 4, 'ciencias', 9000),
	(9, 5, 'de dibujo', 3000),
	(9, 6, 'de colores', 4100);
	
-- SELECT * FROM productos;

-- --------------------------------------- INVENTARIO ---------------------------------------
INSERT INTO inventario (idComercio, idProducto, cantidad) VALUES
	(1, 1, 10),
	(1, 2, 12),
	(1, 3, 4),
	(1, 4, 6),
	(2, 9, 1),
	(2, 10, 50),
	(2, 11, 20),
	(2, 12, 1),
	(2, 13, 13),
	(3, 19, 5),
	(3, 20, 7),
	(3, 21, 2),
	(4, 25, 8),
	(4, 26, 3),
	(4, 27, 2),
	(5, 5, 6),
	(5, 6, 2),
	(5, 7, 9),
	(5, 8, 4),
	(6, 31, 26),
	(6, 32, 2),
	(6, 33, 0),
	(6, 34, 2),
	(7, 22, 2),
	(7, 23, 5),
	(7, 24, 1),
	(8, 28, 3),
	(8, 29, 7),
	(8, 30, 1),
	(9, 39, 15),
	(9, 40, 11),
	(9, 41, 4),
	(9, 42, 0),
	(10, 35, 11),
	(10, 36, 6),
	(10, 37, 1),
	(10, 38, 0),
	(11, 14, 15),
	(11, 15, 28),
	(11, 16, 5),
	(11, 17, 13),
	(11, 18, 9);
	
-- SELECT * FROM inventario;