create database Maestro;

create table profesores(
 cedula_prof varchar(100),
 nombre_prof varchar(100),
 apellido_prof varchar(100),
 telefono varchar(100),
primary key(cedula_prof));

create table materia(
cod_materia varchar(100),
nom_materia varchar(100),
descripsion varchar(100),
intesisdad_horaria varchar(100), 
n_creditos varchar(100),
PRIMARY KEY (cod_materia));

create table materia_profesor(
cod_materi varchar(100),
cedula_pro varchar(100),
PRIMARY KEY (cod_materi,cedula_pro));

 alter table materia_profesor
 add constraint FK_cod_materi
  foreign key (cod_materi)
  references materia(cod_materia);

   alter table materia_profesor
 add constraint FK_cedula_pro
  foreign key (cedula_pro)
  references profesores(cedula_prof);

   
CREATE TABLE persona (
   id serial ,
   doc varchar(100) ,
   nom varchar(100) ,
   ape varchar(100),
   fecha date NOT NULL,
   tel varchar(100) ,
   cel varchar(100),
   sexo varchar(100) ,
   dir varchar(100) ,
   nota varchar(100) ,
   fechar date ,
   estado varchar(100),
  PRIMARY KEY (id)
);
CREATE TABLE username(
  id serial, 
  usu varchar(100), 
  con varchar(100) ,
  correo varchar(100),
  fecha date,
  tipo varchar(100), 
  PRIMARY KEY (id)
);
 

CREATE TABLE estudiante(
  codigo_est varchar(100), 
  nombre_est varchar(100) ,
  apellido_est varchar(100),
  telefono varchar(100), 
  PRIMARY KEY (codigo_est)
);

INSERT INTO profesores(
            cedula_prof, nombre_prof, apellido_prof, telefono)
    VALUES (1, 'jose','sotelo', 356723456);
    
   INSERT INTO materia(
            cod_materia, nom_materia, descripsion, intesisdad_horaria, n_creditos)
    VALUES (1029, 'electiva4', 'programacion orientada a objetos', 4, 3);

 INSERT INTO materia_profesor(
            cod_materi, cedula_pro)
    VALUES (1029, 1);


INSERT INTO persona(
            id, doc, nom, ape, fecha, tel, cel, sexo, dir, nota, fechar,estado)
    VALUES (1,1069745934, 'juan', 'chiquiza', '1988-04-05', 23456789, 3156856245, 'm', 'Barrio balmoral', 'NINGUNA','2014-01-07','s');

    

INSERT INTO username(id, usu, con, correo, fecha, tipo) VALUES
(3, 23, 'marta', 'juanchiquiza@gmail.com', '1988-04-05', 'a');

INSERT INTO username(
            id, usu, con, correo, fecha, tipo)
    VALUES (12, 23, 'marta','juanchiquiza@gmail.com', '2-2-2', 'c');

    INSERT INTO persona(
            id, doc, nom, ape, fecha, tel, cel, sexo, dir, nota, fechar,estado)
    VALUES (2,2555, 'marta', 'gomez', '1988-04-05', 23456789, 3156856245, 'm', 'Barrio balmoral', 'NINGUNA','2014-01-07','s');

  
-- para estudiante
INSERT INTO username(
            id, usu, con, correo, fecha, tipo)
    VALUES (14, 3252222, 'fabian','jolfer@gmail.com', '5-2-1990', 'e');

    INSERT INTO persona(
            id, doc, nom, ape, fecha, tel, cel, sexo, dir, nota, fechar,estado)
    VALUES (14,3252222, 'fabian', 'gomez', '5-2-1990', 2456, 2456, 'm', 'Barrio gaitan', 'NINGUNA','2015-01-07','s');

--para profesor "6543234";"jose";"sotelo";"9876543"

INSERT INTO username(
            id, usu, con, correo, fecha, tipo)
    VALUES (15, 6543234, 'jose','jose@gmail.com', '5-2-1980', 'c');

    INSERT INTO persona(
            id, doc, nom, ape, fecha, tel, cel, sexo, dir, nota, fechar,estado)
    VALUES (15,6543234, 'jose', 'sotelo', '5-2-1980', 9876543, 9876543, 'm', 'Barrio florida', 'NINGUNA','2015-01-07','s');