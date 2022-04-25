-- CREATE casa
CREATE OR REPLACE FUNCTION insertarCasa (inNumero VARCHAR(20), infiguraCs geometry(Polygon,4326))

	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO casa(numero, figuraCs) VALUES (inNumero, infiguraCs);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar casa'; 
	END
$$;

-- READ
CREATE OR REPLACE FUNCTION LeerCasa(inIdCasa INT)
	RETURNS table(idCasa INT, numero VARCHAR(20), figuraCs geometry(Polygon,4326))
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT casa.idCasa, casa.numero, casa.figuraCs
			FROM casa
			WHERE casa.idCasa = inIdCasa;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer casa'; 
	END;
$$;

-- UPDATE
CREATE OR REPLACE FUNCTION modificarCasa (inIdCasa INT, inNumero VARCHAR(20), infiguraCs geometry(Polygon,4326))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE casa
		SET numero = inNumero, figuraCs = infiguraCs
		WHERE idCasa = inIdCasa; 
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar casa'; 
	END;
$$;

-- DELETE
CREATE OR REPLACE FUNCTION EliminarCasa(inIdCasa INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Eliminar de la tabla casa
		DELETE FROM casa
		WHERE idCasa = inIdCasa;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar casa'; 
	END;
$$;

---- Pruebas
SELECT insertarCasa ('Casa#6-E', 'POLYGON((11 8, 12 8, 12 9, 11 9, 11 8))');
SELECT LeerCasa (25);
SELECT modificarCasa (25, 'Casa#7-E', 'POLYGON((11 8, 12 8, 12 9, 11 9, 11 8))');
SELECT EliminarCasa(25);
SELECT * FROM casa;