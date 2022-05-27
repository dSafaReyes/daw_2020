create database entregable_p2;

create table entregable_p2.talla (
    id int(10) auto_increment not null,
    descripcion varchar(300),
    ancho_cuello double,
    ancho_torso double,
    ancho_cintura double,
    largo_manga double,
    largo_cuello_cintura double,
    constraint talla_pk primary key (id)
);

create table entregable_p2.tipo (
    id int(10) auto_increment not null,
    descripcion varchar(300),
    constraint tipo_pk primary key (id)
);

create table entregable_p2.tipo_tallas (
    id_talla int(10),
    id_tipo int(10),
    constraint tipo_tallas_fk_1 foreign key (id_talla) references entregable_p2.talla(id), 
    constraint tipo_tallas_fk_2 foreign key (id_tipo) references entregable_p2.tipo(id) 
);

create table entregable_p2.marca_ropa (
    id int(10) auto_increment not null,
    descripcion varchar(300),
    url_logo varchar(100),
    constraint marca_ropa_pk primary key (id)
);

create table entregable_p2.articulo_ropa (
    id int(10) auto_increment not null,
    nombre varchar(100),
    precio_base double,
    id_tipo int(10),
    id_talla int(10),
    id_marca_ropa int(10),
    constraint articulo_ropa_pk primary key (id),
    constraint articulo_ropa_fk_1 foreign key (id_tipo) references entregable_p2.tipo(id),
    constraint articulo_ropa_fk_2 foreign key (id_talla) references entregable_p2.talla(id),
    constraint articulo_ropa_fk_3 foreign key (id_marca_ropa) references entregable_p2.marca_ropa(id)
);

create table entregable_p2.tienda (
    id int(10) auto_increment not null,
    direccion varchar(100),
    codigo_postal varchar(15),
    ciudad varchar(100),
    id_marca_ropa int(10),
    constraint tienda_pk primary key (id),
    constraint tienda_fk foreign key (id_marca_ropa) references entregable_p2.marca_ropa(id)
);

create table entregable_p2.stock_articulo (
    id int(10) auto_increment not null,
    cantidad int(10),
    precio double,
    id_tienda int(10),
    id_articulo_ropa int(10),
    constraint stock_articulo_pk primary key (id),
    constraint stock_articulo_fk_1 foreign key (id_tienda) references entregable_p2.tienda(id),
    constraint stock_articulo_fk_2 foreign key (id_articulo_ropa) references entregable_p2.articulo_ropa(id)
);

create table entregable_p2.empleado (
    id int(10) auto_increment not null,
    nombre varchar(100),
    apellidos varchar(100),
    dni varchar(9),
    movil varchar(15),
    es_encargado boolean,
    id_tienda int(10),
    constraint empleado_pk primary key (id),
    constraint empleado_fk foreign key (id_tienda) references entregable_p2.tienda(id)
);

insert into entregable_p2.talla (descripcion, ancho_cuello, ancho_torso, ancho_cintura, largo_manga, largo_cuello_cintura)
values  ('Ipsum quaerat amet consectetur modi amet.', 40, 46, 48, 68, 73),
        ('Ipsum numquam numquam numquam.', 38, 42, 55, 65, 72),
        ('Ipsum velit tempora voluptatem neque quaerat.', 37, 44, 54, 68, 75),
        ('Modi aliquam ut sit magnam consectetur.', 38, 46, 54, 67, 73),
        ('Ipsum numquam ut neque porro aliquam.', 37, 42, 59, 66, 75),
        ('Porro labore est etincidunt porro.', 39, 43, 52, 67, 70),
        ('Voluptatem est porro labore neque numquam quisquam dolore.', 43, 49, 54, 67, 73),
        ('Amet aliquam labore quisquam etincidunt.', 42, 49, 56, 66, 72),
        ('Dolor modi sed magnam quisquam.', 42, 48, 61, 66, 74),
        ('Voluptatem numquam voluptatem tempora.', 42, 47, 50, 69, 75);

insert into entregable_p2.tipo (descripcion)
values  ('Dolor dolore neque aliquam ut etincidunt neque.'),
        ('Modi modi velit quiquia magnam etincidunt.'),
        ('Magnam non est dolorem.'),
        ('Labore adipisci voluptatem magnam velit non voluptatem.'),
        ('Ut ipsum magnam adipisci quiquia magnam.'),
        ('Non velit dolore numquam quiquia velit etincidunt.'),
        ('Quiquia quisquam quaerat sed numquam consectetur.'),
        ('Modi ipsum dolor sed.'),
        ('Est labore ut adipisci.'),
        ('Dolore quaerat tempora modi quaerat.');

-- tipo_tallas 

insert into entregable_p2.marca_ropa (descripcion, url_logo)
values  ('Dolorem dolorem consectetur ipsum sed.', 'https://nuevatienda.com/Amet/dolor/magnam/non/modi/porro.'),
        ('Voluptatem dolorem magnam magnam adipisci ipsum aliquam.', 'https://nuevatienda.com/Voluptatem/dolorem/dolorem/neque/neque/modi.'),
        ('Sed quaerat aliquam velit numquam.', 'https://nuevatienda.com/Aliquam/quiquia/numquam/labore/etincidunt/porro/sit.'),
        ('Etincidunt ut quaerat eius.', 'https://nuevatienda.com/Quaerat/neque/consectetur/magnam/dolore.'),
        ('Consectetur aliquam porro eius labore.', 'https://nuevatienda.com/Sit/non/neque/etincidunt/labore/quisquam.'),
        ('Est etincidunt dolorem etincidunt amet.', 'https://nuevatienda.com/Porro/non/non/quisquam/non/eius/magnam.'),
        ('Ipsum quaerat magnam magnam adipisci aliquam.', 'https://nuevatienda.com/Numquam/quisquam/sed/modi/amet.'),
        ('Dolorem est non eius.', 'https://nuevatienda.com/Neque/dolor/dolore/quaerat.'),
        ('Non non quaerat eius est.', 'https://nuevatienda.com/Est/tempora/eius/numquam/adipisci/adipisci.'),
        ('Etincidunt dolor porro non quiquia.', 'https://nuevatienda.com/Magnam/dolor/modi/sit.');

insert into entregable_p2.articulo_ropa (nombre, precio_base) --faltan
values  ('Lázaro', 24.9),
        ('Leonardo', 16.6),
        ('Ángela', 38.3),
        ('Enrique', 17.9),
        ('Cristian', 11.2),
        ('Ariadna', 18.6),
        ('Úrsula', 10.1),
        ('Emilio', 39.4),
        ('Nicolás', 33.9),
        ('Basileo', 24);

insert into entregable_p2.tienda (direccion, codigo_postal, ciudad)
values  ('Calle David Reyes', 15334, 'Zaragoza'),
        ('Calle Natalia Núñez', 36451, 'Valencia'),
        ('Calle Silvia Molina', 20666, 'Gipuzkoa'),
        ('Calle Guillermo Nieto', 17919, 'Cáceres'),
        ('Calle Damián Álvarez', 36209, 'Cuenca'),
        ('Calle Alfredo Díez', 31857, 'Santa'),
        ('Calle Teodosia Ortiz', 39493, 'Sevilla'),
        ('Calle Gloria Iglesias', 35561, 'Burgos'),
        ('Calle Natividad Moreno', 47626, 'Almería'),
        ('Calle Camilo Mora', 33958, 'Lleida');
 
insert into entregable_p2.stock_articulo(cantidad, precio)
values  (11850, 20.6),
        (10553, 31.3),
        (11486, 12.3),
        (11825, 11.5),
        (11084, 13.9),
        (11173, 21.8),
        (11375, 36.9),
        (10270, 23.6),
        (11907, 32.9),
        (11839, 19.6);

insert into entregable_p2.empleado(nombre, apellidos, dni, movil, es_encargado)
values  ('Santiago', 'Carmona', '99951705R', '675711254', true)
        ('Celina', 'Serrano', '76945848O', '606010202', true)
        ('Moisés', 'Delgado', '86349454L', '687841061', false)
        ('Concepción', 'Parra', '75486454C', '618771439', true)
        ('Rogelio', 'Prieto', '48505950K', '611492323', false)
        ('Joan', 'Gallego', '71209587A', '691582560', false)
        ('Colombo', 'Santana', '70721082P', '625461217', false)
        ('Pablo', 'León', '82451096D', '665423262', true)
        ('Reinaldo', 'Martínez', '92225846Z', '634593996', false)
        ('Epifanía', 'Gil', '17476609O', '611410942', true);