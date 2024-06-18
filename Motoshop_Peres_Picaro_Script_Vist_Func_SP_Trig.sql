use motoshop;

DELIMITER \\
create function `ganancia` (costo float, porcentaje float) returns float
DETERMINISTIC
BEGIN
	declare iva float;
    declare resultado float;
    set iva = 21;	
    set resultado = costo + (costo * (porcentaje + iva) / 100);
    return resultado;
END \\

select all ganancia(costo_unit, 25) as precio_sugerido, costo_unit as costo from compra_producto;