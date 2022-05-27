create database GOT;

create table GOT.reino (
    id int(2) auto_increment not null,
    nombre varchar(150),
    extension float,
    constraint reino_pk primary key (id)
);

create table GOT.casa (
    id int(2) auto_increment not null,
    nombre varchar(150),
    blossom varchar(150),
    id_reino int(2),
    constraint casa_pk primary key (id),
    constraint casa_fk foreign key (id_reino) 
        references GOT.reino(id)
        on update cascade
        on delete cascade
);

create table GOT.personaje (
    id int(3) auto_increment not null,
    nombre varchar(30),
    apellido varchar(30),
    apodo varchar(30),
    f_nacimiento date,
    sexo boolean,
    inteligencia int(2),
    influencia int(2),
    fuerza int(2),
    destreza int(2),
    id_casa int(2),
    constraint personaje_pk primary key (id),
    constraint personaje_fk foreign key (id_casa) references GOT.casa(id),
);

create table GOT.casar (
    id_personaje1 int(3),
    id_personaje2 int(3),
    constraint casar_fk1 foreign key (id_personaje1) references GOT.personaje(id),
    constraint casar_fk2 foreign key (id_personaje2) references GOT.personaje(id)
);

create table GOT.ser_progenitor (
    id_personaje1 int(3),
    id_personaje2 int(3),
    es_madre boolean,
    constraint ser_progenitor foreign key (id_personaje1) references GOT.personaje(id),
    constraint ser_progenitor foreign key (id_personaje2) references GOT.personaje(id)
);

create table GOT.personaje_reino (
    id_personaje int(3),
    id_reino int(2),
    constraint personaje_reino_fk1 foreign key (id_personaje) references GOT.personaje(id),
    constraint personaje_reino_fk2 foreign key (id_reino) references GOT.personaje(id),
);

create table GOT.ciudad (
    id int(3) auto_increment not null,
    nombre varchar(150),
    pblcn_total float,
    es_capital boolean,
    id_reino int(3),
    constraint ciudad_pk primary key (id),
    constraint ciudad_fk foreign key (id_reino) references GOT.reino(id)
);

create table GOT.casa_ciudad (
    id_casa int(3),
    id_ciudad int(3),
    constraint casa_ciudad_fk_1 foreign key (id_casa) references GOT.casa(id),
    constraint casa_ciudad_fk_2 foreign key (id_ciudad) references GOT.ciudad(id)
);

create table GOT.ejercito (
    id int(3) auto_increment not null,
    n_infanteria int(5),
    n_caballeria int(5),
    n_arqueros int(5),
    constraint ejercito_pk primary key (id)
);

create table GOT.aliar (
    id_casa1 int(3),
    id_casa2 int(3),
    constraint aliar_fk_1 foreign key (id_casa1) references GOT.casa(id),
    constraint aliar_fk_2 foreign key (id_casa2) references GOT.casa(id),
);

create table GOT.batalla (
    id_batalla int(3) auto_increment not null,
    lugar varchar(150),
    f_batalla date,
    constraint batalla_pk primary key (id)
);

create table GOT.casa_batalla (
    id_casa int(3),
    id_batalla int(3),
    es_vencedor boolean,
    constraint casa_batalla_fk_1 foreign key (id_casa) references GOT.casa(id),
    constraint casa_batalla_fk_2 foreign key (id_batalla) references GOT.batalla(id)
);

alter table nombre_tabla auto_increment=1;