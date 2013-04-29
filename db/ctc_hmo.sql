CREATE TABLE nodos(
       id_nodo serial,
       NumNodo int(3) not null,
       Ubicacion fulltext not null,
       Nivel varchar(3) not null,
       primary key(id_nodo)
)engine=innodb default character set=utf8 collate=utf8_spanish_ci;

CREATE table colonias(
       id_colonia serial,
       NombreColonia varchar(50) not null,
       primary key(id_colonia)
)engine=innodb default character set=utf8 collate=utf8_spanish_ci;

CREATE table relaciones(
       re_idColonia int not null,
       re_idNodo int not null,
       index fk_colonia(re_idColonia),
       index fk_nodo(re_idNodo),
       constraint re_idColonia foreign key(re_idColonia) references colonias(id_colonia) on delete no action on update no action,
       constraint re_idNodo foreign key(re_idNodo) references nodos(id_nodo) on delete no action on update no action
)engine=innodb default character set=utf8 collate=utf8_spanish_ci;

#select NumNodo, Ubicacion, Nivel, NombreColonia from colonias c inner join nodos n on n.id_nodo=c.id_nodos WHERE id_colonia in (1,2) ;

#select NumNodo, Ubicacion, Nivel, NombreColonia from colonias c inner join nodos n on n.id_nodo=c.id_nodos WHERE NombreColonia = 'Altares';

select * from colonias;

INSERT INTO nodos (NumNodo, Ubicacion, Nivel) VALUES ('CIS VERA', '2C', '22'),
    ('0', 'D', '0'),
    ('1', 'L / A'',	34'),
    ('2', '4C', '34'),
    ('3', '2F', '34'),
    ('4', 'H\'', '18'),
    ('5', '2G', '32,4'),
    ('6', '5B', '34'),
    ('7', '1E / 6C', '18'),
    ('8', '2A', '34')
);

select * from nodos;

INSERT INTO relaciones (re_idColonia, re_idNodo) VALUES (2,2),(2,3), (2,4);

select * from relaciones;

SELECT NombreColonia,NumNodo,Ubicacion,Nivel FROM relaciones r INNER JOIN colonias c ON c.id_colonia=re_idColonia 
INNER JOIN nodos n ON n.id_nodo=re_idNodo WHERE NombreColonia='4 Olivos';