
CREATE TABLE artist (
  artist_id  INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  id_director INT,
  role_id INT,
);
INSERT INTO artist (artist_id, first_name, last_name, role_id) VALUES (1,'John','TRAVOLTA',1,1);
INSERT INTO artist (artist_id, first_name, last_name, role_id) VALUES (2,'Bruce','WILLIS',2,2);
INSERT INTO artist (artist_id, first_name, last_name, role_id) VALUES (3,'Quentin','TARANTINO',NULL,3);
INSERT INTO artist (artist_id, first_name, last_name, role_id) VALUES (4,'Robert','DE NIRO',NULL,NULL);
INSERT INTO artist (artist_id, first_name, last_name, role_id) VALUES (5,'Pam','GRIER',NULL,NULL);

CREATE TABLE film (
  id INT PRIMARY KEY,
  id_director INT,
  film_name VARCHAR(40),
  year INT
);
INSERT INTO film (id,id_director,film_name,year) VALUES (1,1,'Pulp Fiction',1994);
INSERT INTO film (id,id_director,film_name,year) VALUES (2,2,'Jackie Brown',1997);

CREATE TABLE role (
  id INT PRIMARY KEY,
  role VARCHAR(40),
  film_id INT
);
INSERT INTO role (id, role, film_id) VALUES (1,'Vincent VEGA',1);
INSERT INTO role (id, role, film_id) VALUES (2,'Butch COOLIDGE',2);
INSERT INTO role (id, role, film_id) VALUES (3,'Jimmy DIMMICK',NULL);
