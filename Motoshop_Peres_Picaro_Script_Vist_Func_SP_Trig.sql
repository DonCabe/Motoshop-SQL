USE motoshop;
-- FUNCIONES --
-- Precio sugerido para la venta al publico
DELIMITER \\
CREATE FUNCTION `precio_sugerido` (costo FLOAT, porcentaje FLOAT) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE iva FLOAT;
    DECLARE precio FLOAT;
    SET iva = 21;
    SET precio = costo + (costo * (porcentaje + iva) / 100);
    RETURN precio;
END \\

-- Descuento por cantidad de motos compradas
DELIMITER \\
CREATE FUNCTION `descuento_aplicable` (cantidad INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    IF cantidad >= 5 THEN
        RETURN 0.10; -- 10% de descuento para 5 o más motocicletas
    ELSEIF cantidad >= 3 THEN
        RETURN 0.05; -- 5% de descuento para 3 o más motocicletas
    ELSE
        RETURN 0.00; -- Sin descuento
    END IF;
END \\

-- VISTAS --
-- Vista de empleados con total de ventas historicas
CREATE VIEW vista_ventas_empleado_trimestre AS
	SELECT e.id_empleado, CONCAT(e.nombre,' ', e.apellido) AS empleado, COUNT(v.id_venta) AS ventas_trimestre, SUM(v.precio_vta) AS total_facturado
	FROM empleado e
	INNER JOIN venta v ON e.id_empleado = v.id_empleado
    WHERE v.fecha_venta BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND CURDATE()
	GROUP BY e.id_empleado, e.nombre, e.apellido
	HAVING ventas_trimestre > 0
	ORDER BY ventas_trimestre DESC;

-- Vista de cantidad de cantidad de pedidos realizados en el último semestre, así como su proveedor
CREATE VIEW vista_cant_pedidos_semestre AS
	SELECT p.denominacion AS proveedor, COUNT(oc.id_compra) AS cantidad_pedidos
	FROM orden_compra oc
	JOIN proveedor p ON oc.id_proveedor = p.id_proveedor
	WHERE oc.fecha_pedido BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE()
	GROUP BY p.denominacion
	ORDER BY cantidad_pedidos DESC;

-- Vista de tickets de taller sin finalizar con datos del cliente
CREATE VIEW vista_taller_en_curso AS
	SELECT tt.id_ticket, tt.patente, CONCAT(c.nombre,' ', c.apellido) AS cliente, c.telefono AS telefono_cliente,
		CONCAT(e.nombre,' ', e.apellido) AS empleado, tt.fecha_inicio, tt.descripcion, tt.costo_service
	FROM ticket_taller tt
	INNER JOIN cliente c ON tt.id_cliente = c.id_cliente
	INNER JOIN empleado e ON tt.id_empleado = e.id_empleado
	WHERE tt.fecha_fin IS NULL;

-- Vista de compras que aún no fueron recibidas con datos del proveedor
CREATE VIEW vista_pedidos_pendientes AS
	SELECT oc.id_compra, p.denominacion AS proveedor, e.id_empleado AS id_empleado, e.nombre AS empleado_pedido, oc.fecha_pedido, oc.fecha_llegada
	FROM orden_compra oc
	INNER JOIN proveedor p ON oc.id_proveedor = p.id_proveedor
	INNER JOIN empleado e ON oc.id_empl_pedido = e.id_empleado
	WHERE oc.fecha_llegada IS NULL;

-- Vista de cantidad total historica de ventas por partido/departamento o zona
CREATE VIEW vista_tot_ventas_territorio AS
	SELECT pr.nombre AS nombre_provincia, pa.nombre AS nombre_partido, COUNT(v.id_venta) AS cantidad_ventas
	FROM venta v
	JOIN cliente c ON v.id_cliente = c.id_cliente
	JOIN partido pa ON c.id_partido = pa.id_partido
	JOIN provincia pr ON c.id_provincia = pr.id_provincia
	GROUP BY pr.nombre, pa.nombre
	ORDER BY cantidad_ventas DESC;

-- PROCEDIMIENTOS --
-- Procedimiento de actualización de stock y precio
DELIMITER \\
CREATE PROCEDURE `upd_compra_stock` (
	IN c_id_producto INT,
    IN c_cantidad INT,
    IN c_nue_precio FLOAT
)
BEGIN
	UPDATE motocicleta m
	SET m.stock = m.stock + c_cantidad,
		m.precio_uni = c_nue_precio,
		m.fecha_stock = CURDATE()
	WHERE m.id_moto = c_id_producto;
END \\

-- Procedimiento de actualización de titularidad
DELIMITER \\
CREATE PROCEDURE `upd_titular_moto` (
    IN upd_patente VARCHAR(8),
    IN upd_id_titular INT
)
BEGIN
    UPDATE moto_cliente
    SET id_titular = upd_id_titular
    WHERE patente = upd_patente;
END \\

-- Procedimiento de reporte de ventas por año
DELIMITER \\
CREATE PROCEDURE ventas_por_mes_anio (
    IN anio INT
)
BEGIN
    SELECT YEAR(v.fecha_venta) AS anio, MONTH(v.fecha_venta) AS mes, COUNT(v.id_venta) AS cantidad_ventas, SUM(v.precio_vta) AS ventas_totales
    FROM venta v
    WHERE YEAR(v.fecha_venta) = anio
    GROUP BY YEAR(v.fecha_venta), MONTH(v.fecha_venta)
    ORDER BY anio, mes;
END \\

-- Procedimiento de top 10 motos mas vendidas
DELIMITER \\
CREATE PROCEDURE top_10_motos_vendidas_anio (
    IN anio INT
)
BEGIN
    SELECT m.marca, m.modelo, COUNT(v.id_venta) AS cantidad_vendida
    FROM venta v
    JOIN motocicleta m ON v.id_moto = m.id_moto
    WHERE YEAR(v.fecha_venta) = anio
    GROUP BY m.marca, m.modelo
    ORDER BY cantidad_vendida DESC
    LIMIT 10;
END \\

-- TRIGGERS --
-- Triggers de log de empleados
DELIMITER \\
CREATE TRIGGER log_empleado_ins
AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO log_empleado (id_empleado, cargo_log, fecha_log, telefono_log, email_log, detalle_log)
    VALUES (NEW.id_empleado, NEW.cargo, NOW(), NEW.telefono, NEW.email, 'ALTA');
END \\

DELIMITER \\
CREATE TRIGGER log_empleado_upd
AFTER UPDATE ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO log_empleado (id_empleado, cargo_log, fecha_log, telefono_log, email_log, detalle_log)
    VALUES (NEW.id_empleado, NEW.cargo, NOW(), NEW.telefono, NEW.email, 'MODIFICADO');
END \\

DELIMITER \\
CREATE TRIGGER log_empleado_del
BEFORE DELETE ON empleado
FOR EACH ROW
BEGIN
    INSERT INTO log_empleado (id_empleado, cargo_log, fecha_log, telefono_log, email_log, detalle_log)
    VALUES (OLD.id_empleado, OLD.cargo, now(), OLD.telefono, OLD.email, 'ELIMINADO');
END \\

-- Triggers de log de moto_clientes
DELIMITER \\
CREATE TRIGGER log_moto_cliente_ins
AFTER INSERT ON moto_cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_moto_cliente (patente, id_titular_actual, fecha_log, detalle_log)
    VALUES (NEW.patente, NEW.id_titular, NOW(), 'ALTA');
END \\

DELIMITER \\
CREATE TRIGGER log_moto_cliente_upd
AFTER UPDATE ON moto_cliente
FOR EACH ROW
BEGIN
	IF OLD.id_titular != NEW.id_titular THEN
		INSERT INTO log_moto_cliente (patente, id_titular_actual, fecha_log, detalle_log)
		VALUES (NEW.patente, NEW.id_titular, NOW(), 'NUEVO TITULAR');
	END IF;
END \\

-- Trigger de actualización de stock por venta
DELIMITER \\
CREATE TRIGGER upd_stock_venta
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
	UPDATE motocicleta m
	SET m.stock = m.stock - 1
	WHERE m.id_moto = NEW.id_moto;
END \\