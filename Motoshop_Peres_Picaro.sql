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
id_proveedor int not null,
marca varchar(30) not null,
modelo varchar(30) not null,
anio year not null,
cilindrada smallint not null,
costo int not null,
	foreign key (id_proveedor) references proveedor(id_proveedor)
);

create table venta (
id_venta int not null auto_increment primary key,
id_cliente int not null,
id_moto int not null,
id_empleado int not null,
fecha_venta date not null,
costo_venta int not null,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_moto) references motocicleta(id_moto),
	foreign key (id_empleado) references empleado(id_empleado)
);

create table service (
id_service int not null auto_increment primary key,
id_cliente int not null,
id_moto int not null,
id_empleado int not null,
fecha_service date not null,
descripcion varchar(500),
costo_service int not null,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_moto) references motocicleta(id_moto),
	foreign key (id_empleado) references empleado(id_empleado)
);
