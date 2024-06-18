use motoshop;

-- Insercion de clientes --
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Javier','Migliore','11-6895-8834','jmigliore@gmail.com','Reconquista 945, San Antonio de Areco, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Nicolas','Maspoli','11-1315-0475','nmaspoli@hotmail.com','Roque Saenz Peña 4378, Olivos, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Leonardo','Veron','11-3307-3109','lveron@hotmail.com','Salta 1035, Tres de Febrero, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Claudia','Marozzi','11-4325-3145','cmarozzi@gmail.com','Obispo Trejo 242, San Martín, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Martin','Maccio','11-4786-2731','mmaccio@hotmail.com','La Rioja 115, CABA, CABA');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Javier','Raffa','11-6319-9397','jraffa@gmail.com','Ruta Nacional 51 KM 5, Esteban Echeverría, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Esteban','Peralta','11-6164-3633','eperalta@hotmail.com','España 635, Esteban Echeverría, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Martín','Perez','11-7038-1721','mperez@gmail.com','San Jerónimo 98, Tres de Febrero, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Naiara','Szarfsztejn','11-5229-8841','nszarfsztejn@gmail.com','General Güemes 650, Tres de Febrero, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Cersar','Bergna','11-9467-6737','cbergna@yahoo.com.ar','Rondeau 798, San Martín, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Zenteno','Rocha','11-8476-8942','zrocha@yahoo.com.ar','Oncativo 50, Tres de Febrero, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Alfredo','Zapata','11-3490-8007','azapata@gmail.com','Roque Pérez 3650, Lanús, Buenos Aires');
insert into cliente (nombre, apellido, telefono, email, direccion) values ('Adrian','Villar','11-6175-9425','avillar@gmail.com','Av Córdoba 2409, CABA, CABA');
insert into cliente (nombre, apellido, email, direccion) values ('Arturo','Ohaco','aohaco@gmail.com','Zapiola 4121, San Martín, Buenos Aires');
insert into cliente (nombre, apellido, direccion) values ('Ariel','Michelli','Honduras 5670, CABA, CABA');

-- Insercion de empleados --
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('Leon Jose','Nuovo','Vendedor Ejecutivo','2005-05-01','011-4373-5373','ljnuovo@gmail.com');
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('Miguel Angel','Centeno','Mecanico Ejecutivo','2007-02-01','011-6736-2711','macenteno@gmail.com');
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('Paola','Nuovo','Administrativa','2010-09-01','011-6856-2375','pnuovo@gmail.com');
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('Luis Nicolas','Elmen','Mecanico','2012-03-01','011-6678-7538','lnelmen@gmail.com');
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('Patricio Veron','Nuovo','Vendedor','2013-11-01','011-6736-2711','macenteno@gmail.com');
insert into empleado (nombre, apellido, cargo, fecha_alta, telefono, email) values ('José','Perez','Vendedor','2017-08-01','011-6509-5169','jperez_995@gmail.com');

-- Insercion de proveedores --
insert into proveedor (denominacion, telefono, email, direccion) values ('Gilera Motors Arg. S.A.','02274 43-0241','info@gilera.com.ar','G. Marconi 805, Carlos Spegazzini, Buenos Aires');
insert into proveedor (denominacion, telefono, email, direccion) values ('Betamotor Argentina S.A.','011 5245-6752','info@betamotor.com.ar','Jorge Peralta Martínez 2330, Tigre, Buenos Aires');
insert into proveedor (denominacion, telefono, email, direccion) values ('Monsa S.R.L.','011 4602-1555','psebastian@monsa.com.ar','Av. Castañares 6140, CABA');
insert into proveedor (denominacion, email, direccion) values ('Marwen S.A.','hcleonardo@marwen.com.ar','Av. Rivadavia 10759, CABA');
insert into proveedor (denominacion, email) values ('LS2 Argentina S.A.','ismael.gomez@ls2oficial.com.ar');
insert into proveedor (denominacion, direccion) values ('La Emilia S.A.','Raulet 55, CABA');

-- Insercion de motocicletas --
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Beta','ZT310T','2023','310','7400000','4','2024-03-13');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Beta','ZT310M','2024','310','7800000','2','2024-03-13');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Beta','Zontes 350 GK','2024','350','7100000','2','2023-12-20');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Beta','RR 125 Mini','2024','125','2800000','3','2023-12-20');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','Hunk 150','2024','150','2500000','5','2024-02-03');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','Ignitor','2024','125','2000000','2','2024-02-03');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','Dash','2023','110','2200000','1','2023-06-04');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','Dash','2024','110','2700000','3','2024-02-03');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','Hunk 190','2023','190','3400000','4','2024-02-03');
insert into motocicleta (marca, modelo, anio, cilindrada, precio_unit, stock, fecha_stock) values ('Hero','XPulse 200','2023','200','3600000','3','2024-02-03');

select * from motocicleta order by fecha_stock;

-- Insercion de motos por cliente --
insert into moto_cliente (patente, id_cliente, fecha_alta, marca, modelo) values ('A178EQD',1,'2022-10-08','RVM','Tekken-250');
insert into moto_cliente (patente, id_cliente, fecha_alta, marca, modelo) values ('A168NDF',6,'2023-06-25','Gilera','YL200');
insert into moto_cliente (patente, id_cliente, fecha_alta, marca, modelo) values ('A126IQV',4,'2023-04-23','Gilera','Smash');
insert into moto_cliente (patente, id_cliente, fecha_alta, id_moto) values ('A201CQC',1,'2024-03-05',5);
insert into moto_cliente (patente, id_cliente, fecha_alta, id_moto) values ('A210ABC',15,'2024-05-10',1);
insert into moto_cliente (patente, id_cliente, fecha_alta, marca, modelo) values ('A178EQD',6,'2024-05-10','RVM','Tekken-250');

-- Insercion de articulos --
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('LS2','Casco rookie talles S-M-L','138000','6','2024-02-20');
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('LS2','Casco challenger allert mate talles L','494000','1','2024-02-20');
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('LS2','Campera Gallant Hombre Negra talles M-L','138000','6','2024-02-20');
insert into articulo (detalle, precio_unit, stock, fecha_stock) values ('Bulbo stop suzuki en125-gn125','2600','20','2023-12-03');
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('Yamaha','Motor xj6 completo orinal de fabrica','890000','1','2021-07-02');
insert into articulo (detalle, precio_unit, stock, fecha_stock) values ('kit transmision completa gilera smash 110','28000','2','2024-05-12');
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('Hero','Espejos Hunk 190R','40000','4','2024-04-05');
insert into articulo (marca, detalle, precio_unit, stock, fecha_stock) values ('Hero','Espejos Hunk 150','28000','3','2024-03-03');
insert into articulo (detalle, precio_unit, stock, fecha_stock) values ('lampara stop','2000','30','2024-04-10');
insert into articulo (detalle, precio_unit, stock, fecha_stock) values ('luz led azul','8000','10','2024-03-25');

-- Insercion de ventas --
insert into venta (id_cliente, id_empleado, fecha_venta) values (1,1,'2006-01-01');
insert into venta (id_cliente, id_empleado, fecha_venta) values (2,1,'2007-04-15');
insert into venta (id_cliente, id_empleado, fecha_venta) values (3,3,'2010-11-20');
insert into venta (id_cliente, id_empleado, fecha_venta) values (9,5,'2013-12-01');
insert into venta (id_cliente, id_empleado, fecha_venta) values (10,1,'2014-03-01');
insert into venta (id_cliente, id_empleado, fecha_venta) values (12,5,'2023-12-01');
insert into venta (id_cliente, id_empleado, fecha_venta) values (1,6,'2024-02-25');
insert into venta (id_cliente, id_empleado, fecha_venta) values (15,6,'2024-05-01');
insert into venta (id_cliente, id_empleado, fecha_venta) values (4,4,'2024-05-14');

-- Insercion de productos por venta --
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (1,3,138000,2);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (2,1,494000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (2,3,138000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (3,4,2600,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (4,6,28000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (4,7,40000,2);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (4,9,2000,2);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (4,10,8000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (5,6,28000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (6,6,28000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (6,10,8000,3);
insert into venta_producto (id_venta, id_producto, es_moto, precio_vta_unit, cantidad) values (7,5,true,2500000,1);
insert into venta_producto (id_venta, id_producto, es_moto, precio_vta_unit, cantidad) values (8,1,true,7400000,1);
insert into venta_producto (id_venta, id_producto, precio_vta_unit, cantidad) values (9,6,30000,1);

-- Insercion de ordenes de compra --
insert into orden_compra (id_proveedor, id_emp_pedido, fecha_pedido, fecha_llegada) values (1,1,'2024-01-18','2024-02-03');
insert into orden_compra (id_proveedor, id_emp_pedido, fecha_pedido, fecha_llegada) values (2,1,'2024-02-05','2024-02-20');
insert into orden_compra (id_proveedor, id_emp_pedido, fecha_pedido, fecha_llegada) values (3,4,'2024-05-01','2024-05-12');
insert into orden_compra (id_proveedor, id_emp_pedido, fecha_pedido, fecha_llegada) values (5,1,'2024-01-03','2024-02-20');
insert into orden_compra (id_proveedor, id_emp_pedido, fecha_pedido) values (5,1,'2024-06-10');

-- Insercion de productos por compra --
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (1,1,true,5500000,2);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (1,2,true,5700000,2);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (2,5,true,1800000,4);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (2,6,true,1300000,2);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (2,8,true,2000000,3);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (2,9,true,2200000,4);
insert into compra_producto (id_compra, id_producto, es_moto, costo_unit, cantidad) values (2,10,true,2400000,3);
insert into compra_producto (id_compra, id_producto, costo_unit, cantidad) values (3,6,18000,2);
insert into compra_producto (id_compra, id_producto, costo_unit, cantidad) values (4,1,95000,4);
insert into compra_producto (id_compra, id_producto, costo_unit, cantidad) values (4,2,300000,1);
insert into compra_producto (id_compra, id_producto, costo_unit, cantidad) values (4,3,92000,4);

-- Insercion de tickets de Taller --
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A178EQD',1,2,'2022-10-08','2022-10-08','service - mantenimiento general - mano de obra',8000);
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A126IQV',4,2,'2023-04-23','2023-04-24','service - mantenimiento general - mano de obra',12000);
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A168NDF',6,2,'2023-06-25','2023-06-25','service - mantenimiento general - mano de obra',15000);
insert into ticket_taller (patente, id_cliente, id_empleado, id_venta_repuestos, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A126IQV',4,4,9,'2024-05-10','2024-05-14','falla de transmision, cambio c/repuesto y mano de obra',35000); --
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A201CQC',1,4,'2024-03-05','2024-03-05','service - mantenimiento general - mano de obra',25000);
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A178EQD',6,4,'2024-05-10','2024-05-10','service - mantenimiento general - mano de obra',40000);
insert into ticket_taller (patente, id_cliente, id_empleado, fecha_inicio, fecha_fin, descripcion, costo_service) 
values ('A210ABC',15,2,'2024-05-10','2024-05-10','service - mantenimiento general - mano de obra',60000);