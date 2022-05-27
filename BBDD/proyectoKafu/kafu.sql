DROP DATABASE IF EXISTS Kafu;
CREATE DATABASE IF NOT EXISTS Kafu;

CREATE TABLE Kafu.empleado (
    id int(5) auto_increment NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    dni varchar(9),
    numero_empleado varchar(5),
    tipo_empleado varchar(50),
    constraint empleado_pk primary key (id)
);
CREATE TABLE Kafu.mesa (
    id int(5) auto_increment NOT NULL,
    n_asientos int(1),
    libre boolean, 
    id_empleado int(5),
    constraint mesa_pk primary key (id),
    constraint mesa_fk foreign key (id_empleado) references Kafu.empleado(id) 
); 
CREATE TABLE Kafu.comanda (
    id int(5) auto_increment NOT NULL,
    servido boolean,
    pagado boolean,
    id_mesa int(5),
    constraint comanda_pk primary key (id),
    constraint comanda_fk foreign key (id_mesa) references Kafu.mesa(id)
);
CREATE TABLE Kafu.plato (
    id int(5) auto_increment NOT NULL,
    nombre varchar(50),
    descripcion varchar(300),
    precio float,
    tipo_plato varchar(50),
    constraint plato_pk primary key (id)
);
CREATE TABLE Kafu.comanda_plato (
    id_comanda int(5),
    id_plato int(5),
    constraint comanda_plato_fk_1 foreign key (id_comanda) references Kafu.comanda(id),
    constraint comanda_plato_fk_2 foreign key (id_plato) references Kafu.plato(id)
);
