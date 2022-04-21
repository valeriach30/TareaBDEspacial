-- CREATE tipo Producto
CREATE OR REPLACE FUNCTION insertarProducto (idComercio INT, idTipoProducto INT, nombre VARCHAR(20), precio MONEY)

	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO productos(idComercio, nombre, idTipoProducto, precio) VALUES (idComercio, nombre, idTipoProducto, precio);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar Tipo de Producto'; 
	END
$$

-- READ
CREATE OR REPLACE FUNCTION LeerProducto(inProducto INT)
	RETURNS table(idProducto INT, idComercio INT, idTipoProducto INT, nombre VARCHAR(20), precio MONEY)
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT  Productos.idProducto,  Productos.idComercio , Productos.idTipoProducto, Productos.nombre, Productos.precio
			FROM Productos
			WHERE Productos.idProducto = inProducto;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer tipo Producto'; 
	END;
$$;

-- UPDATE
CREATE OR REPLACE FUNCTION modificarProducto(inProd INT, nuevoIdComercio INT, nuevoIdTipoProducto INT, nuevoNombre VARCHAR(20), nuevoPrecio MONEY)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE Productos
		SET  productos.IdComercio = nuevoIdComercio ,
		productos.IdTipoProducto = nuevoIdTipoProducto , productos.Nombre = nuevoNombre, productos.Precio = nuevoPrecio
		WHERE productos.idProducto = inProd; 
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar tipo de Producto'; 
	END;
$$;

-- DELETE
CREATE OR REPLACE FUNCTION EliminarProducto(inProducto INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		
		-- Eliminar de la tabla Producto
		DELETE FROM Productos
		WHERE idProducto = inProducto;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar'; 
	END;
$$;

---- Pruebas
SELECT insertarProducto(1,1,'XD',1000);
SELECT LeerProducto(10);
SELECT modificarProducto(10, 2,2,'XDnt',2000);
SELECT EliminarProducto(10);

SELECT * FROM Producto;