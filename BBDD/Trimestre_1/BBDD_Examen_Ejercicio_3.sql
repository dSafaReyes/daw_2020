create database EXAMEN;
create table EXAMEN.animal (
    id int(10) auto_increment not null,
    especie varchar(150),
    raza varchar(50),
    es_salvaje boolean,
    es_domestico boolean,
    constraint animal_pk primary key (id)
);
create table EXAMEN.refugio (
    id int(10) auto_increment not null,
    nombre varchar(150),
    direccion varchar(150),
    capacidad int(10),
    constraint refugio_pk primary key (id)
);
create table EXAMEN.mascota (
    id int(10) auto_increment not null,
    nombre varchar(150),
    peso float,
    id_animal int(10),
    id_refugio int(10),
    constraint mascota_pk primary key (id),
    constraint mascota_fk_1 foreign key (id_animal) references EXAMEN.animal(id),
    constraint mascota_fk_2 foreign key (id_refugio) references EXAMEN.refugio(id)
);
create table EXAMEN.cliente (
    id int(10) auto_increment not null,
    nombre varchar(50),
    apellidos varchar(50),
    dni varchar(9),
    id_mascota int(10),
    constraint cliente_pk primary key (id),
    constraint cliente_fk foreign key (id_mascota) references EXAMEN.mascota(id)
);
create table EXAMEN.adopcion (
    id int(10) auto_increment not null,
    codigo varchar(50),
    id_cliente int(10),
    id_refugio int(10),
    id_mascota int(10),
    constraint adopcion_pk primary key (id),
    constraint adopcion_fk_1 foreign key (id_cliente) references EXAMEN.cliente(id),
    constraint adopcion_fk_2 foreign key (id_refugio) references EXAMEN.refugio(id),
    constraint adopcion_fk_3 foreign key (id_mascota) references EXAMEN.mascota(id)
);

insert into EXAMEN.animal (especie, raza, es_salvaje, es_domestico)
values  ('Alemán', 'Audi', true, false),
        ('Alemán', 'BMW', false, false),
        ('Alemán', 'Mercedes', false, true),
        ('Español', 'Seat', false, true),
        ('Japonés', 'Nissan', true, true);

insert into EXAMEN.refugio (nombre, direccion, capacidad)
values  ('Pray for dogs', 'Calle Espartero nº 17', 160),
        ('Adopta un perro', 'Calle Trujillo nº 3', 180),
        ('Llevame a casa', 'Calle San Sebastián nº 14', 180),
        ('Perros sin pulgas', 'Calle Luz nº 2', 270),
        ('Donde caben dos caben tres', 'Avenida Juan Carlos II nº 7', 140);

insert into EXAMEN.mascota (nombre, peso, id_refugio, id_animal)
values  ('Ramsés', 5.8, 1, 2),
        ('Poseidón', 6.8, 2, 3),
        ('Zeus', 4.8, 1, 4),
        ('Atenea', 1.5, 3, 5),
        ('Moncho', 7.4, 2, 5);

insert into EXAMEN.cliente (nombre, apellidos, dni, id_mascota)
values  ('Lola', 'Fernández Mareno', '30128413R', 1),
        ('Lalo', 'Fernández Mireno', '30128423E', 2),
        ('Lele', 'Fernández Mereno', '30128433G', 3),
        ('Lale', 'Fernández Mureno', '30128443S', 4),
        ('Lela', 'Fernández Moreno', '30128453R', 5);

insert into EXAMEN.adopcion (codigo, id_cliente, id_refugio, id_mascota)
values  ('350X', 1, 2, 4),
        ('351X', 3, 4, 5),
        ('352X', 5, 5, 2),
        ('353X', 2, 1, 3),
        ('354X', 3, 3, 1);

drop table EXAMEN.adopcion;
drop table EXAMEN.cliente;
drop table EXAMEN.mascota;
drop table EXAMEN.refugio;
drop table EXAMEN.animal;
drop database EXAMEN;