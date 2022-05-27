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
values  ('Emilia', 'García', '23040265J', 'Hildegarda@gmail.com', '954901158', 'Calle Xavier Santos'),
        ('Liduvina', 'González', '46950322N', 'Siro@gmail.com', '954607086', 'Calle Josep Hidalgo'),
        ('Verónica', 'Carmona', '64167028V', 'Ricardo@gmail.com', '954422954', 'Calle Virginia García'),
        ('Gustavo', 'Sanz', '41144916E', 'Aureliano@gmail.com', '954737634', 'Calle David Vicente'),
        ('Lidia', 'Prieto', '67173636N', 'Míriam@gmail.com', '954953323', 'Calle Heriberto Cambil'),
        ('Esperanza', 'Moreno', '58315210E', 'Antonia@gmail.com', '954400034', 'Calle Cesáreo Prieto'),
        ('Lorenzo', 'Ortega', '39000183D', 'Cipriano@gmail.com', '954844225', 'Calle Santiago Gómez'),
        ('Gerardo', 'Esteban', '44392733U', 'Sixto@gmail.com', '954747630', 'Calle Felipe Román'),
        ('Clotilde', 'Guerrero', '41521925M', 'Noé@gmail.com', '954483286', 'Calle Bonifacio Crespo'),
        ('Augusto', 'Sáez', '55885035Q', 'Fausto@gmail.com', '954961408', 'Calle Priscila Cano');

insert into entregable_p1.asignatura (codigo,nombre,horas_semanales)
values  ('50261127Q' , 'Matemáticas', 2),
        ('92343019G' , 'Lengua Española', 4),
        ('48815653Y' , 'Biología', 1),
        ('57135001R' , 'Historia', 3),
        ('33432058F' , 'Geología', 4),
        ('22022397E' , 'Aprende con Alf', 1),
        ('99704430F' , 'Educación Física', 3),
        ('67650969M' , 'Física', 3),
        ('49386127S' , 'Química', 5),
        ('30504961A' , 'Educación Cívica', 5);

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
