/********************************************************************************************************
 *											NOCIONES BÁSICAS DE BBDD 									* 
 ********************************************************************************************************/

/* Creación de bases de datos */
create database prueba;
create table prueba.proveedores (
	nombre varchar(25),
	localidad varchar(30) default 'Palencia'
);
create table prueba.prestamos (
	id_prestamos int(10) auto_increment not null,
	/*fecha_prestamo date default sysdate*/
);
alter table prueba.proveedores add apellido varchar(25) after nombre;

create table cliente (
	id int(10) auto_increment not null,
	nombre varchar(100) not null,
	apellidos varchar(100) not null,
	num_telefono varchar(100) not null,
	dni varchar(100) not null,
	constraint cliente_pk primary key (id),
	constraint cliente_un unique key (dni)
)

create table pedido (
	id int(10) not null auto_increment,
	cod_pedido varchar(100) not null,
)

drop database tienda;

/* Ejercicio 1. */
create database e01_resuelto;

create table e01_resuelto.direccion (
	id_direccion int(5) auto_increment not null,
	calle varchar(50) not null,
	comuna varchar(50) not null,
	constraint direccion_pk primary key (id_direccion)
);

create table e01_resuelto.direccion_cliente (
	id_direccion int(5) not null,
	id_cliente int(5) not null,
	/* EL NOMBRE DE LAS FOREIGN KEY DEBE SER DISTINTO */
	constraint direccion_cliente_fk_1 foreign key(id_direccion) references e01_resuelto.direccion(id_direccion),
	constraint direccion_cliente_fk_2 foreign key(id_cliente) references e01_resuelto.cliente(id_cliente)
);

create table e01_resuelto.cliente (	
	id_cliente int(5) auto_increment not null,
	saldo int(10),
	lim_credit int(10),
	constraint cliente_pk primary key (id_cliente)
);

create table e01_resuelto.pedido(
	id_pedido int(5) auto_increment not null,
	/* PONER FECHA POR DEFECTO */
	fecha date,
	lim_credito int(10) not null,
	id_cliente int(5),
	constraint pedido_pk primary key(id_pedido),
	constraint pedido_fk foreign key(id_cliente) references e01_resuelto.cliente(id_cliente)
);

create table e01_resuelto.articulo_pedido(
	id_articulo int(5) not null,
	id_pedido int(5) not null,
	constraint articulo_pedido_fk_1 foreign key (id_articulo) references e01_resuelto.articulo(id_articulo),
	constraint articulo_pedido_fk_2 foreign key (id_pedido) references e01_resuelto.pedido(id_pedido)
);

create table e01_resuelto.articulo(
	id_articulo int(5) auto_increment not null,
	descripcion varchar(50),
	constraint articulo primary key (id_articulo)
);

create table e01_resuelto.articulo_fabrica(
	id_articulo int(5) not null,
	id_fabrica int(5) not null,
	constraint articulo_fabrica_fk1 foreign key (id_articulo) references e01_resuelto.articulo(id_articulo),
	constraint articulo_fabrica_fk2 foreign key (id_fabrica) references e01_resuelto.fabrica(id_fabrica)
);

create table e01_resuelto.fabrica(
	id_fabrica int(5) auto_increment not null,
	telefono varchar(11),
	constraint fabrica_pk primary key (id_fabrica)
);

alter table e01_resuelto.cliente add es_hombre bool after id_cliente;


/* Ejercicio 1. Crear BBDD del FIFA */
/* Ejercicio 2. Crear BBDD de Juego de tronos */
