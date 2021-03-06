create database entregable_p1;

create table entregable_p1.profesor (
    id int(10) auto_increment not null,
    nombre varchar(100),
    apellidos varchar(100),
    dni varchar(9),
    email varchar(100),
    telefono varchar(15),
    direccion varchar(50),
    constraint profesor_pk primary key (id)
);

create table entregable_p1.asignatura (
    id int(10) auto_increment not null,
    codigo varchar(50),
    nombre varchar(50),
    horas_semanales int(1),
    constraint asignatura_pk primary key (id)
);

create table entregable_p1.curso (
    id int(10) auto_increment not null,
    cardinal int(1),
    fase_academica varchar(100),
    constraint curso_pk primary key (id)
);

create table entregable_p1.docencia (
    id_profesor int(10),
    id_asignatura int(10),
    id_curso int(10),
    constraint docencia_fk_1 foreign key (id_profesor) references entregable_p1.profesor(id),
    constraint docencia_fk_2 foreign key (id_asignatura) references entregable_p1.asignatura(id),
    constraint docencia_fk_3 foreign key (id_curso) references entregable_p1.curso(id)
);

create table entregable_p1.horario (
    id_curso int(10),
    id_asignatura int(10),
    dia_semana char(1),
    hora_inicio time,
    hora_fin time,
    constraint horario_fk_1 foreign key (id_curso) references entregable_p1.curso(id),
    constraint horario_fk_2 foreign key (id_asignatura) references entregable_p1.asignatura(id)
);

create table entregable_p1.asignatura_curso (
    id_curso int(10),
    id_asignatura int(10),
    constraint asignatura_curso_fk_1 foreign key (id_curso) references entregable_p1.curso(id),
    constraint asignatura_curso_fk_2 foreign key (id_asignatura) references entregable_p1.asignatura(id)
);

create table entregable_p1.alumno (
    id int(10) auto_increment not null,
    nombre varchar(100),
    apellidos varchar(100),
    dni varchar(9),
    email varchar(100),
    telefono varchar(15),
    direccion varchar(50),
    constraint alumno_pk primary key (id)
);

create table entregable_p1.expediente (
    id_alumno int(10),
    id_asignatura int(10),
    id_curso int(10),
    evaluacion int(1),
    nota double,
    constraint expediente_fk_1 foreign key (id_alumno) references entregable_p1.alumno(id),
    constraint expediente_fk_2 foreign key (id_asignatura) references entregable_p1.asignatura(id),
    constraint expediente_fk_3 foreign key (id_curso) references entregable_p1.curso(id)
);

create table entregable_p1.matricula (
    id_alumno int(10),
    id_curso int(10),
    id_asignatura int(10),
    constraint matricula_fk_1 foreign key (id_alumno) references entregable_p1.alumno(id),
    constraint matricula_fk_2 foreign key (id_curso) references entregable_p1.curso(id),
    constraint matricula_fk_3 foreign key (id_asignatura) references entregable_p1.asignatura(id)
);

drop table entregable_p1.matricula;
drop table entregable_p1.expediente;
drop table entregable_p1.alumno;
drop table entregable_p1.asignatura_curso;
drop table entregable_p1.horario;
drop table entregable_p1.docencia;
drop table entregable_p1.curso;
drop table entregable_p1.asignatura;
drop table entregable_p1.profesor;
drop database entregable_p1;

insert into entregable_p1.profesor (nombre, apellidos, dni, email, telefono, direccion)
values  ('Emilia', 'Garc??a', '23040265J', 'Hildegarda@gmail.com', '954901158', 'Calle Xavier Santos'),
        ('Liduvina', 'Gonz??lez', '46950322N', 'Siro@gmail.com', '954607086', 'Calle Josep Hidalgo'),
        ('Ver??nica', 'Carmona', '64167028V', 'Ricardo@gmail.com', '954422954', 'Calle Virginia Garc??a'),
        ('Gustavo', 'Sanz', '41144916E', 'Aureliano@gmail.com', '954737634', 'Calle David Vicente'),
        ('Lidia', 'Prieto', '67173636N', 'M??riam@gmail.com', '954953323', 'Calle Heriberto Cambil'),
        ('Esperanza', 'Moreno', '58315210E', 'Antonia@gmail.com', '954400034', 'Calle Ces??reo Prieto'),
        ('Lorenzo', 'Ortega', '39000183D', 'Cipriano@gmail.com', '954844225', 'Calle Santiago G??mez'),
        ('Gerardo', 'Esteban', '44392733U', 'Sixto@gmail.com', '954747630', 'Calle Felipe Rom??n'),
        ('Clotilde', 'Guerrero', '41521925M', 'No??@gmail.com', '954483286', 'Calle Bonifacio Crespo'),
        ('Augusto', 'S??ez', '55885035Q', 'Fausto@gmail.com', '954961408', 'Calle Priscila Cano');

insert into entregable_p1.asignatura (codigo,nombre,horas_semanales)
values  ('50261127Q' , 'Matem??ticas', 2),
        ('92343019G' , 'Lengua Espa??ola', 4),
        ('48815653Y' , 'Biolog??a', 1),
        ('57135001R' , 'Historia', 3),
        ('33432058F' , 'Geolog??a', 4),
        ('22022397E' , 'Aprende con Alf', 1),
        ('99704430F' , 'Educaci??n F??sica', 3),
        ('67650969M' , 'F??sica', 3),
        ('49386127S' , 'Qu??mica', 5),
        ('30504961A' , 'Educaci??n C??vica', 5);

insert into entregable_p1.curso (cardinal, fase_academica)
values  (3, "E.S.O."),
        (4, "E.S.O."),
        (1, "E.S.O."),
        (2, "Bachillerato"),
        (1, "Bachillerato"),
        (3, "Bachillerato"),
        (1, "Primaria"),
        (2, "Primaria"),
        (3, "Primaria");
