-- CREATE Inventario
CREATE OR REPLACE FUNCTION crearInventario(idProd INT, idCom INT, cantidad INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO inventario (idComercio, idProducto, Cantidad)
		VALUES (idProd, idCom, cantidad);
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al insertar inventario'; 
	END;
$$

-- Read Inventario
-- Recibe como parametro el id de inventario
CREATE OR REPLACE FUNCTION LeerInventario(inInv INT)
	RETURNS table(idInv		INT,
				  idCom		INT,
				  nomCom	VARCHAR(20),
				  idProd	INT, 
				  nomProd	VARCHAR(20),
				  cantidad	INT)
	LANGUAGE plpgsql
AS
$$
	BEGIN
		RETURN QUERY 
			SELECT  inventario.idInventario, inventario.idComercio, 
			comercio.numero, inventario.idProducto, 
			productos.nombre, inventario.cantidad
			FROM inventario
			-- Conectar tabla con productos
			INNER JOIN productos
			ON inventario.idProducto = productos.idProducto
			-- Conectar tabla con comercios
			INNER JOIN comercio
			ON inventario.idComercio = comercio.idComercio
			WHERE inventario.idInventario = inInv;
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al leer Inventario'; 
	END;
$$;

-- Update cantidades en Inventario
CREATE OR REPLACE FUNCTION modificarInventario(inInventario INT, nuevaCant INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		-- Modificar los atributos
		UPDATE inventario
		SET cantidad = nuevaCant
		WHERE idInventario = inInventario;
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al modificar cantidad de inventario'; 
	END;
$$;

-- Delete Inventario
CREATE OR REPLACE FUNCTION EliminarInventario (inId INT)
	RETURNS void
	LANGUAGE plpgsql
AS
$$
	BEGIN
		
		-- Eliminar de la tabla inventario
		DELETE FROM inventario 
		WHERE idInventario = inId;
		
	-- Manejo de errores
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al eliminar'; 
	END;
$$;


--- PRUEBA Read
SELECT * FROM LeerInventario(20); 
SELECT modificarInventario(20, 30);
SELECT eliminarInventario(20);
SELECT crearInventario(1,1,1);