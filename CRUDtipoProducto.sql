-- CREATE tipo Producto
CREATE OR REPLACE FUNCTION insertarTipoProducto (nombre VARCHAR(20))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO tipoProducto(nombre) VALUES (nombre);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar Tipo de Producto'; 
	END
$$;

-- READ
CREATE OR REPLACE FUNCTION LeerTipoProducto(inTipoProducto INT)
	RETURNS table(idTipoProducto INT, descripcion VARCHAR(20))
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT  tipoProducto.idtipoProducto, tipoProducto.nombre
			FROM tipoProducto
			WHERE tipoProducto.idtipoProducto = inTipoProducto;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer tipo Producto'; 
	END;
$$;

-- UPDATE
CREATE OR REPLACE FUNCTION modificarTipoProducto(inProd INT, nuevoNombre VARCHAR(20))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE tipoProducto
		SET nombre = nuevoNombre
		WHERE idtipoProducto = inProd;
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar tipo de Producto'; 
	END;
$$;

-- DELETE
CREATE OR REPLACE FUNCTION EliminarTipoProducto(inTipoProducto INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		
		-- Eliminar de la tabla tipoProducto
		DELETE FROM tipoProducto
		WHERE idtipoProducto = inTipoProducto;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar'; 
	END;
$$;

---- Pruebas
SELECT insertarTipoProducto('Gaseosas frescas');
SELECT LeerTipoProducto(10);
SELECT modificarTipoProducto(10, 'Gaseosas');
SELECT EliminarTipoProducto(10);

SELECT * FROM tipoProducto;