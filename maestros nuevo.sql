create table profesores(
 cedula_prof varchar(5),
 nombre_prof varchar(30),
 apellido_prof varchar(30),
 telefono varchar(30),
primary key(cedula_prof));

create table materia(
cod_materia varchar(5),
nom_materia varchar(50),
descripsion varchar(100),
intesisdad_horaria varchar(35), 
n_creditos varchar(30),
PRIMARY KEY (cod_materia));

create table materia_profesor(
cod_materi varchar(5),
cedula_pro varchar(50),
PRIMARY KEY (cod_materi,cedula_pro));

 alter table materia_profesor
 add constraint FK_cod_materi
  foreign key (cod_materi)
  references materia(cod_materia);

   alter table materia_profesor
 add constraint FK_cedula_pro
  foreign key (cedula_pro)
  references profesores(cedula_prof);

  DELETE FROM profesores
 WHERE cedula_prof = '242';

INSERT INTO profesores(
            cedula_prof, nombre_prof, apellido_prof, telefono)
    VALUES (1, 'jose','sotelo', 356723456);
    
   INSERT INTO materia(
            cod_materia, nom_materia, descripsion, intesisdad_horaria, n_creditos)
    VALUES (1029, 'electiva4', 'programacion orientada a objetos', 4, 3);

 INSERT INTO materia_profesor(
            cod_materi, cedula_pro)
    VALUES (1029, 1);
   
CREATE TABLE persona (
   id serial ,
   doc varchar(255) ,
   nom varchar(255) ,
   ape varchar(255),
   fecha date NOT NULL,
   tel varchar(255) ,
   cel varchar(255),
   sexo varchar(255) ,
   dir varchar(255) ,
   nota varchar(255) ,
   fechar date ,
   estado varchar(255),
  PRIMARY KEY (id)
);
CREATE TABLE username(
  id serial, 
  usu varchar(255), 
  con varchar(255) ,
  correo varchar(255),
  fecha date,
  tipo varchar(255), 
  PRIMARY KEY (id)
); 

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
    VALUES (2,23, 'marta', 'gomez', '1988-04-05', 23456789, 3156856245, 'm', 'Barrio balmoral', 'NINGUNA','2014-01-07','s');

  select e.codigo_est,e.nombre_est,e.apellido_est,e.telefono, ma.nom_materia from 
  estudiante e,materia ma,materia_profesor mp,materia_estudiante me
  where ma.cod_materia = me.cod_materi and e.codigo_est = me.codigo_es
  and mp.cod_materi = ma.cod_materia and mp.cedula_pro='23' 

  select e.codigo_est,e.nombre_est,e.apellido_est,e.telefono, ma.nom_materia from estudiante e,materia ma,materia_profesor mp,materia_estudiante me where ma.cod_materia = me.cod_materi and e.codigo_est = me.codigo_es and mp.cod_materi = ma.cod_materia and mp.cedula_pro='23' 

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
    

DELETE FROM persona
 WHERE  id = '13';

 DELETE FROM username
 WHERE  id = '13';
 
 DELETE  FROM materia_profesor
  DELETE  FROM profesores
   DELETE  FROM materia
    DELETE  FROM estudiante
     DELETE  FROM materia_estudiante


select ma.nom_materia, pr.nombre_prof,ma.cod_materia
from materia ma,materia_profesor mp , profesores pr
where mp.cedula_pro = pr.cedula_prof  and pr.nombre_prof = 'jose' GROUP BY  pr.nombre_prof,ma.nom_materia,ma.cod_materia

select ma.nom_materia, pr.nombre_prof,ma.cod_materia
from materia ma,materia_profesor mp , profesores pr
where mp.cedula_pro = pr.cedula_prof  and  ma.cod_materia= mp.cod_materi and  pr.nombre_prof = 'jose' 

  
    drop table profesores
drop table materia
drop table materia_profesor;

SELECT * FROM materia_profesor 
join profesores on  materia_profesor.cedula_pro=profesores.cedula_prof
 join materia on  materia_profesor.cod_materi=materia.cod_materia
  where materia_profesor.cedula_pro = $username
