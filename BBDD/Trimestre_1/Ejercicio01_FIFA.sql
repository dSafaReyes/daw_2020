create database FIFA;

create table FIFA.quimica (
    idJugador1 int(5),
    idJugador2 int(5),
    afinidad_equipo boolean,
    afinidad_pais boolean,
    afinidad_liga boolean,
    afinidad_total int(2),
    constraint quimica_fk1 foreign key idJugador1 references FIFA.jugador(idJugador),
    constraint quimica_fk2 foreign key idJugador2 references FIFA.jugador(idJugador)
);

create table FIFA.jugador (
    idJugador int(5) auto_increment not null,
    nombre varchar(30),
    apellido varchar(30),
    nacionalidad varchar(30),
    posicion varchar(30),
    /* Empieza las características */
    tiro int(2),
    fisico int(2),
    ritmo int(2),
    pase int(2),
    regate int(2),
    defensa int(2),
    /* Preguntar como se calcula la media */
    valoracion_total int(2),
    idEquipo int(5),
    constraint jugador_pk primary key (idJugador),
    constraint jugador_fk foreign key (idEquipo) references FIFA.equipo(idEquipo)
);

create table FIFA.equipo (
    idEquipo int(5) auto_increment not null,
    nombre varchar(30),
    /* Preguntar como introducir url */
    escudo varchar(30),
    abreviatura varchar(30),
    idLiga int(5),
    idEstadio int(5),
    constraint equipo_pk primary key (idEquipo),
    constraint equipo_fk_1 foreign key (idLiga) references FIFA.liga(idLiga),
    constraint equipo_fk_2 foreign key (idEstadio) references FIFA.estadio(idEstadio)
);

create table FIFA.equipo_entrenador (
    idEquipo int(5),
    idEntrenador int(5),
    constraint equipo_entrenador_1 foreign key (idEquipo) references FIFA.equipo(idEquipo),
    constraint equipo_entrenador_2 foreign key (idEntrenador) references FIFA.idEntrenador(idEnrenador)
);

create table FIFA.entrenador (
    idEntrenador int(5) auto_increment not null,
    nombre varchar(30),
    apellidos varchar(30),
    nacionalidad varchar(30),
    constraint entrenador_pk primary key (idEntrenador)
);

create table FIFA.liga (
    idLiga int(5) auto_increment not null,
    pais varchar(30),
    /* FALTA Premios */
    premios ,
    /* FALTA Poner máximo */
    n_maximo int(5),
    constraint liga_pk primary key (idLiga)
);

/* Preguntar que pasa si pongo una longitud en un lado y otro en otra */

/* Preguntar cómo poner premios */

create table FIFA.estadio (
    idEstadio int(5) auto_increment not null,
    ciudad varchar(30),
    pais varchar(30),
    cap_maxima int(5),
    anio_construccion date,
    constraint estadio primary key (idEstadio)
);

create table FIFA.equipo_partido (
    idEquipo int(5),
    idPartido int(5),
    esLocal boolean,
    constraint equipo_partido_1 foreign key (idEquipo) references FIFA.equipo(idEquipo),
    constraint equipo_partido_2 foreign key (idPartido) references FIFA.partido(idPartido)
);

create table FIFA.partido (
    idPartido int(5) auto_increment not null,
    resultado varchar(30),
    fecha_partido date,
    constraint partido primary key (idPartido)
);

create table FIFA.estadistica (
    idEstadistica int(5) auto_increment not null,
    goles int(2),
    asist int(2),
    amarillas int(1),
    rojas int(1),
    idPartido int(5),
    constraint estadistica_pk primary key (idEstadistica),
    constraint estadistica_fk foreign key (idPartido) references FIFA.partido(idPartido)
);

create table FIFA.estadistica_jugador (
    idEstadistica int(5),
    idJugador int(5),
    constraint estadistica_jugador_fk1 foreign key (idEstadistica) references FIFA.estadistica(idEstadistica),
    constraint estadistica_jugador_fk2 foreign key (idJugador) references FIFA.jugador(idJugador)
);

