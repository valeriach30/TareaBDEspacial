-- CREATE comercio
CREATE OR REPLACE FUNCTION insertarcomercio (inIdTipo INT,
	inNumero VARCHAR(20),
	inAbreH TIME,
	inCierraH TIME,
	inFiguraCm geometry(Polygon,4326))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO comercio(idTipo, numero, abreH, cierraH, figuraCm) 
		VALUES (inIdTipo, inNumero, inAbreH, inCierraH, inFiguraCm);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar comercio'; 
	END
$$;

-- READ
CREATE OR REPLACE FUNCTION LeerComercio(inIdComercio INT)
	RETURNS table(idTipo INT,
	numero VARCHAR(20),
	abreH TIME,
	cierraH TIME,
	figuraCm geometry(Polygon,4326))
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT comercio.idTipo, comercio.numero, comercio.abreH,
			comercio.cierraH, comercio.figuraCm
			FROM comercio
			WHERE comercio.idComercio = inIdComercio;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer comercio'; 
	END;
$$;

-- UPDATE
CREATE OR REPLACE FUNCTION modificarComercio (inIdComercio INT, inIdTipo INT,
	inNumero VARCHAR(20),
	inAbreH TIME,
	inCierraH TIME,
	inFiguraCm geometry(Polygon,4326))
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE comercio
		SET idTipo = inIdTipo, numero = inNumero, abreH = inAbreH,
		cierraH = inCierraH, figuraCm = inFiguraCm
		WHERE idComercio = inIdComercio; 
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar comercio'; 
	END;
$$;

-- DELETE
CREATE OR REPLACE FUNCTION EliminarComercio(inIdComercio INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Eliminar de la tabla casa
		DELETE FROM comercio
		WHERE idComercio = inIdComercio;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar comercio'; 
	END;
$$;

---- Pruebas 
SELECT insertarComercio (2, 'Comercio#3-E', '6:00:00.0000000', '20:59:59.9999999', 'POLYGON((11 8, 12 8, 12 9, 11 9, 11 8))');
SELECT LeerComercio (12);
SELECT modificarComercio (12, 2, 'Comercio#4-E', '7:00:00.0000000', '21:59:59.9999999', 'POLYGON((11 8, 12 8, 12 9, 11 9, 11 8))');
SELECT EliminarComercio(12);
SELECT * FROM comercio;