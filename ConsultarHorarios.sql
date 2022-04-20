CREATE TYPE datosComercio AS(
	idComercio 	INT,
	idTipo 		INT,
	numero		varchar,
	abreH		TIME,
	cierraH		TIME
);

-- Consultar Locales abiertos 
CREATE OR REPLACE FUNCTION consultarAbiertos(tipoC INT)
	RETURNS SETOF datosComercio
	LANGUAGE plpgsql
AS
$$
	DECLARE reg RECORD;
	BEGIN
		FOR reg IN SELECT idComercio, idTipo, numero, abreH, cierraH FROM comercio
		WHERE abreH < current_time AND current_time < cierraH AND tipoC = idTipo
		LOOP
			RETURN NEXT reg;
		END LOOP;
		RETURN;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al buscar comercios';
	END;
$$;

-- Consultar Horarios
CREATE OR REPLACE FUNCTION consultarHorario(tipoC INT)
	RETURNS SETOF datosComercio
	LANGUAGE plpgsql
AS
$$
	DECLARE reg RECORD;
	BEGIN
		FOR reg IN SELECT idComercio, idTipo, numero, abreH, cierraH FROM comercio
		WHERE tipoC = idTipo
		LOOP
			RETURN NEXT reg;
		END LOOP;
		RETURN;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al buscar comercios';
	END;
$$;

--- Pruebas ---
-- Todos
SELECT idComercio, idTipo, numero, abreH, cierraH FROM comercio;

-- Abiertos
SELECT * FROM consultarAbiertos(1);

-- Horario por tipos
SELECT * FROM consultarHorario(1);