-- UPDATE Productos

-- Modificar precio de un producto
CREATE OR REPLACE FUNCTION modificarPrecio(inProd INT, nuevoPrecio MONEY)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE Productos
		SET precio = nuevoPrecio
		WHERE idProducto = inProd;
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar Producto'; 
	END;
$$;

-- Modificar nombre de un producto
CREATE OR REPLACE FUNCTION modificarNombreProducto(inProd INT, nuevoNombre MONEY)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE Productos
		SET nombre = nuevoNombre
		WHERE idProducto = inProd;
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar Producto'; 
	END;
$$;