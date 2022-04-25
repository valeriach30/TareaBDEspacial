-- CREATE calle
CREATE OR REPLACE FUNCTION insertarCalle (inNombre VARCHAR(20), infiguraCl geometry(LineString,4326))

	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO calle(nombre, figuraCl) VALUES (inNombre, infiguraCl);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar calle'; 
	END
$$;

-- READ
CREATE OR REPLACE FUNCTION LeerCalle(inIdCalle INT)
	RETURNS table(idCalle INT, nombre VARCHAR(20), figuraCl geometry(LineString,4326))
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT calle.idCalle, calle.nombre, calle.figuraCl
			FROM calle
			WHERE calle.idCalle = inIdCalle;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer calle'; 
	END;
$$;

-- UPDATE
CREATE OR REPLACE FUNCTION modificarCalle (inIdCalle INT, inNombre VARCHAR(20), infiguraCl geometry(LineString,4326))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE calle
		SET nombre = inNombre, figuraCl = infiguraCl
		WHERE idCalle = inIdCalle; 
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar calle'; 
	END;
$$;

-- DELETE
CREATE OR REPLACE FUNCTION EliminarCalle(inIdCalle INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Eliminar de la tabla casa
		DELETE FROM calle
		WHERE idCalle = inIdCalle;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar calle'; 
	END;
$$;

---- Pruebas
SELECT insertarCalle ('CalleF', 'LINESTRING(12.5 0, 12.5 8, 10.5 11, 12.5 14.5)');
SELECT LeerCalle (12);
SELECT modificarCalle (12, 'CalleZ', 'LINESTRING(12.5 0, 12.5 8, 10.5 11, 12.5 14.5)');
SELECT EliminarCalle(12);
SELECT * FROM calle;