create schema motoshop;
use motoshop;

create table cliente (
id_cliente int not null auto_increment primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
telefono varchar(15),
email varchar (45),
direccion varchar(100)
);

create table empleado (
id_empleado int not null auto_increment primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
cargo varchar (20) not null,
fecha_alta date not null,
telefono varchar(15),
email varchar (45)
);

create table proveedor (
id_proveedor int not null auto_increment primary key,
denominacion varchar(30) not null,
telefono varchar(15),
email varchar (45),
direccion varchar(100)
);

create table motocicleta (
id_moto int not null auto_increment primary key,
marca varchar(20) not null,
modelo varchar(30) not null,
anio year not null,
cilindrada smallint not null,
precio_unit float not null,
stock int not null,
fecha_stock date not null
);

create table moto_cliente (
patente varchar(8) not null,
id_cliente int not null,
fecha_alta datetime not null,
id_moto int,
marca varchar(20),
modelo varchar(30),
	primary key (patente, id_cliente),
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_moto) references motocicleta(id_moto)
);

create table articulo (
id_articulo int not null auto_increment primary key,
marca varchar(30) default 'generico' not null,
detalle varchar(100) not null,
precio_unit float not null,
stock int not null,
fecha_stock date not null
);

create table venta (
id_venta int not null auto_increment primary key,
id_cliente int not null,
id_empleado int not null,
fecha_venta datetime default now() not null,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_empleado) references empleado(id_empleado)
);

create table venta_producto (
id_venta int not null,
id_producto int not null,
es_moto boolean default FALSE,
precio_vta_unit float not null,
cantidad int not null,
	primary key (id_venta, id_producto),
	foreign key (id_venta) references venta(id_venta),
	foreign key (id_producto) references motocicleta(id_moto),
    foreign key (id_producto) references articulo(id_articulo)
);

create table orden_compra (
id_compra int not null auto_increment primary key,
id_proveedor int not null,
id_emp_pedido int not null,
fecha_pedido datetime default now() not null,
fecha_llegada datetime,
	foreign key (id_proveedor) references proveedor(id_proveedor),
	foreign key (id_emp_pedido) references empleado(id_empleado)
);

create table compra_producto (
id_compra int not null,
id_producto int not null,
es_moto boolean default FALSE,
costo_unit float not null,
cantidad int not null,
	primary key (id_compra, id_producto),
	foreign key (id_compra) references orden_compra(id_compra),
	foreign key (id_producto) references motocicleta(id_moto),
    foreign key (id_producto) references articulo(id_articulo)
);

create table ticket_taller (
id_ticket int not null auto_increment primary key,
patente varchar(8) not null,
id_cliente int not null,
id_empleado int not null,
id_venta_repuestos int,
fecha_inicio datetime default now() not null,
fecha_fin datetime,
descripcion varchar(500),
costo_service int default 0 not null,
	foreign key (patente) references moto_cliente(patente),
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_venta_repuestos) references venta(id_venta),
	foreign key (id_empleado) references empleado(id_empleado)
);