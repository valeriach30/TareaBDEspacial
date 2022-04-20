/*
drop schema public cascade;
create schema public;
*/
CREATE EXTENSION postgis;

CREATE TABLE casa(
	idCiudad SERIAL PRIMARY KEY,
	numero VARCHAR(20),
	figuraCs geometry(Polygon,4326)
);

CREATE TABLE tipoComercio(
	idTipo SERIAL PRIMARY KEY,
	nombre VARCHAR(20)
);

CREATE TABLE comercio(
	idComercio SERIAL PRIMARY KEY,
	idTipo INT,
	numero VARCHAR(20),
	abreH TIME,
	cierraH TIME,
	figuraCm geometry(Polygon,4326)
);

CREATE TABLE calle(
	idCalle SERIAL PRIMARY KEY,
	nombre VARCHAR(20),
	figuraCl geometry(LineString,4326)
);

CREATE TABLE tipoProducto(
	idtipoProducto SERIAL PRIMARY KEY,
	nombre VARCHAR(20)
);


CREATE TABLE productos(
	idProducto SERIAL PRIMARY KEY,
	idComercio INT,
	idtipoProducto INT,
	nombre VARCHAR(20),
	precio MONEY,

	CONSTRAINT fk_Comercio 
	FOREIGN KEY (idComercio)
	REFERENCES comercio,

	CONSTRAINT fk_tipoProd 
	FOREIGN KEY (idtipoProducto)
	REFERENCES tipoProducto
);


CREATE TABLE inventario(
	idInventario SERIAL PRIMARY KEY,
	idComercio INT,
	idProducto INT,
	cantidad INT,
	
	CONSTRAINT fk_ComercioI
	FOREIGN KEY (idComercio)
	REFERENCES comercio,
	
	CONSTRAINT fk_ProductoI
	FOREIGN KEY (idProducto)
	REFERENCES productos
);

