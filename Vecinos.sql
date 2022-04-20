-- Funcion que busca los vecinos de una casa o comercio
-- Identificicador:
--		0: buscar vecinos de una casa
--		1: buscar vecinos de un comercio
CREATE OR REPLACE FUNCTION Vecinos(inIdC INT, inIdent INT)
	RETURNS table(numeroV1 VARCHAR(20), numeroV2 VARCHAR(20))
	LANGUAGE plpgsql
AS
$$
	BEGIN
		IF(inIdent = 0) THEN
			RETURN QUERY
			SELECT b.numero, c.numero
			FROM casa as a
			FULL JOIN comercio as b
			ON ST_Touches((a.figuraCs),b.figuraCm)
			FULL JOIN casa as c
			ON ST_Touches((a.figuraCs),c.figuraCs)
			WHERE a.idCasa = inIdC;
		ELSE
			RETURN QUERY
			SELECT b.numero, c.numero
			FROM comercio as a
			FULL JOIN casa as b
			ON ST_Touches((a.figuraCm),b.figuraCs)
			FULL JOIN comercio as c
			ON ST_Touches((a.figuraCm),c.figuraCm)
			WHERE a.idComercio = inIdC;
		END IF;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al determinar vecinos';
	END;
$$;	

-- Prueba
-- Vecinos de la Casa#3-B
SELECT Vecinos(7, 0);
-- Vecinos del Comercio#1-E
SELECT Vecinos(10, 1);