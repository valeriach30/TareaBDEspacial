--DROP FUNCTION consultarproductos(integer);


--Se inserta la id de la casa para buscar los comercios y los productos
--Se usan varias funciones pora la salida de datos

CREATE OR REPLACE FUNCTION ConsultarProductos(inCasa int)
	RETURNS table(idComercio INT,
				  numero VARCHAR(20),
				  disponible varchar(10),
				  nombre VARCHAR(20),
                  precio money,
                  inventario varchar(10),
                  distancia float)
	LANGUAGE plpgsql
AS
$$
    declare CasaLetra varchar(1);
    declare CasaLetra2 varchar(1);
	BEGIN
        select substr(casa.numero,length(casa.numero),length(casa.numero))  into CasaLetra from casa
        where incasa = casa.idCasa;
        return query select comercio.idComercio,comercio.numero,
            ConsultarApertura(comercio.abreh ,comercio.cierrah) ,
            productos.nombre,
            productos.precio,
            ConsultarInventario(productos.idproducto),
            DistanciaLugares(incasa,comercio.idComercio,2) from comercio
        inner join productos on productos.idComercio = comercio.idComercio
        where CasaLetra = substr(comercio.numero,length(comercio.numero),length(comercio.numero));
        --if () then
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error al consultar productos'; 
    END;
$$;



--Esta funcion sirve para determinar si esta abierto o no el local a la hora actual 
CREATE OR REPLACE FUNCTION ConsultarApertura(abre time,cierra time)
    RETURNS varchar(10)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        if(abre < current_time and cierra > current_time) THEN
            return 'Abierto';
        else
            return 'Cerrado';
        end if;
    EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error'; 
    END;
$$;

--Esta funcion sirve para saber si hay inventario del producto
CREATE OR REPLACE FUNCTION ConsultarInventario(inProducto int)
    RETURNS varchar(10)
    LANGUAGE plpgsql
AS
$$
    declare cantInv int;
    BEGIN
        select inventario.cantidad into cantInv from Productos
        inner join inventario on inventario.idproducto = productos.idproducto
        where inventario.idproducto = inProducto;
		
        if (cantInv > 0) THEN
            return 'Si hay';
        end if;
		return 'No hay';
    EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'Error '; 
    END;
$$;

select * from ConsultarProductos(1);