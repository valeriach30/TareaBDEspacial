-- Distancia entre dos lugares
-- El identificador sirve para determinar la distancia entre que tipos delugares se va a calcular:
-- 0: dos casas
-- 1: dos comercios
-- 2: una casa y un comercio
CREATE OR REPLACE FUNCTION DistanciaLugares(inId1 INT, inId2 INT, inIdentificador INT)
	RETURNS FLOAT
	LANGUAGE plpgsql
AS
$$
	DECLARE distancia FLOAT;
	DECLARE figura1 geometry;
	DECLARE figura2 geometry;
	BEGIN
	-- 2 casas
	IF(inIdentificador = 0) THEN
		SELECT figuraCs
		INTO figura1
		FROM casa
		WHERE idCasa = inId1;
		SELECT figuraCs
		INTO figura2
		FROM casa
		WHERE idCasa = inId2;
	ELSE
		-- 2 comercios
		IF(inIdentificador = 1) THEN
			SELECT figuraCm
			INTO figura1
			FROM comercio
			WHERE idComercio = inId1;
			SELECT figuraCm
			INTO figura2
			FROM comercio
			WHERE idComercio = inId2;
		ELSE
			-- 1 casa y 1 comercio
			SELECT figuraCs
			INTO figura1
			FROM casa
			WHERE idCasa = inId1;
			SELECT figuraCm
			INTO figura2
			FROM comercio
			WHERE idComercio = inId2;
		END IF;
	END IF;
	
	-- Calcular distancia
	SELECT ST_Distance(figura1, figura2)
	INTO distancia;
	RETURN distancia;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al calcular distancia';
	END;
$$;
-- Prueba
-- Entre 2 casas
SELECT DistanciaLugares(1, 24, 0); 
-- Entre 2 comercios
SELECT DistanciaLugares(1, 2, 1); 
-- Entre 1 comercio y 1 casa
SELECT DistanciaLugares(1, 8, 2); 
