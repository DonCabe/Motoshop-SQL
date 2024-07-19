CREATE SCHEMA IF NOT EXISTS motoshop;
USE motoshop;

CREATE TABLE IF NOT EXISTS partido (
id_partido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS provincia (
id_provincia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente (
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
telefono VARCHAR(15),
email VARCHAR (45),
direccion VARCHAR(50),
id_partido INT,
id_provincia INT,
	FOREIGN KEY (id_partido) REFERENCES partido(id_partido),
	FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE IF NOT EXISTS empleado (
id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cargo VARCHAR (20) NOT NULL,
fecha_alta DATETIME NOT NULL,
telefono VARCHAR(15),
email VARCHAR (45)
);

CREATE TABLE IF NOT EXISTS log_empleado (
id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_empleado INT NOT NULL,
cargo_log VARCHAR (20) NOT NULL,
fecha_log DATETIME NOT NULL,
telefono_log VARCHAR(15),
email_log VARCHAR (45),
detalle_log VARCHAR (50),
	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS proveedor (
id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
denominacion VARCHAR(30) NOT NULL,
telefono VARCHAR(15),
email VARCHAR (45),
direccion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS motocicleta (
id_moto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(30) NOT NULL,
anio YEAR NOT NULL,
cilindrada SMALLINT NOT NULL,
precio FLOAT NOT NULL,
stock INT NOT NULL,
fecha_stock DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS moto_cliente (
patente VARCHAR(8) NOT NULL PRIMARY KEY,
id_titular INT NOT NULL,
id_moto INT,
marca VARCHAR(20),
modelo VARCHAR(30),
	FOREIGN KEY (id_titular) REFERENCES cliente(id_cliente),
	FOREIGN KEY (id_moto) REFERENCES motocicleta(id_moto)
);

CREATE TABLE IF NOT EXISTS log_moto_cliente (
id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
patente VARCHAR(8) NOT NULL,
id_titular_actual INT NOT NULL,
fecha_log DATETIME NOT NULL,
detalle_log VARCHAR(50),
	FOREIGN KEY (patente) REFERENCES moto_cliente(patente),
	FOREIGN KEY (id_titular_actual) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS venta (
id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
id_moto INT NOT NULL,
precio_vta FLOAT NOT NULL,
fecha_venta DATETIME DEFAULT NOW() NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS orden_compra (
id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_proveedor INT NOT NULL,
id_empl_pedido INT NOT NULL,
fecha_pedido DATETIME DEFAULT NOW() NOT NULL,
fecha_llegada DATETIME,
	FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
	FOREIGN KEY (id_empl_pedido) REFERENCES empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS compra_moto (
id_compra INT NOT NULL,
id_moto INT NOT NULL,
costo_unit FLOAT NOT NULL,
cantidad INT NOT NULL,
	PRIMARY KEY (id_compra, id_moto),
	FOREIGN KEY (id_compra) REFERENCES orden_compra(id_compra),
	FOREIGN KEY (id_moto) REFERENCES motocicleta(id_moto)
);

CREATE TABLE IF NOT EXISTS ticket_taller (
id_ticket INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
patente VARCHAR(8) NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
fecha_inicio DATETIME DEFAULT NOW() NOT NULL,
fecha_fin DATETIME,
descripcion VARCHAR(300),
costo_service INT DEFAULT 0 NOT NULL,
	FOREIGN KEY (patente) REFERENCES moto_cliente(patente),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);