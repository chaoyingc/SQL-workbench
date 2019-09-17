### Overview
#### MySQL Workbench is a unified visual tool for database architects, developers, and DBAs. MySQL Workbench provides data modeling, SQL development, and comprehensive administration tools for server configuration, user administration, backup, and much more.
For downloading mysql workbench, please click this lien : https://dev.mysql.com/doc/workbench/en/wb-installing.html
MySQL Workbench is available for Windows, Linux, and macOS, for information about those platforms that are officially supported, see https://www.mysql.com/support/supportedplatforms/workbench.html .
##### Requirements:
- MySQL server: Although it is not required, MySQL Workbench is designed to have either a remote or local MySQL server connection.  
- docker
- benchwork
### project:
This project will 
- create a database 'company' with 3 tables from the file 'bdd.csv' which is not clean;
- dockerize the database
- connect the docker container with benchwork
##### creating create.sql:
```
$ mkdir -p ~/my-mysql/sql-scripts
$ cd ~/my-mysql/sql-scripts
```
##### Creating a Docker Image
```
$ cd ~/my-mysql/
$ docker build -t my-mysql .
$ docker run -d -p 3306:3306 --name my-mysql \
-e MYSQL_ROOT_PASSWORD=supersecret my-mysql

``` 
Then run 'exec' command to enter into the container:
```
$ docker run -d -p 3306:3306 --name my-mysql \
```
Then run 'exec' command to enter into the container:
```
$ docker exec -it my-mysql bash
```

Once you are in the container,run:
```
$ mysql -u root -p
Enter password: (supersecret)
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| company            |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| artist            |
| film              |
| role              |
+-------------------+
3 rows in set (0.01 sec)
mysql> select * from role;
+----+----------------+---------+
| id | role           | film_id |
+----+----------------+---------+
|  1 | Vincent VEGA   |       1 |
|  2 | Butch COOLIDGE |       2 |
|  3 | Jimmy DIMMICK  |    NULL |
+----+----------------+---------+
3 rows in set (0.00 sec)

mysql> select * from artist;
+-----------+------------+-----------+---------+
| artist_id | first_name | last_name | role_id |
+-----------+------------+-----------+---------+
|         1 | John       | TRAVOLTA  |       1 |
|         2 | Bruce      | WILLIS    |       2 |
|         3 | Quentin    | TARANTINO |       3 |
|         4 | Robert     | DE NIRO   |    NULL |
|         5 | Pam        | GRIER     |    NULL |
+-----------+------------+-----------+---------+
5 rows in set (0.00 sec)
mysql> select * from film;
+----+-------------+--------------+------+
| id | id_director | film_name    | year |
+----+-------------+--------------+------+
|  1 |           1 | Pulp Fiction | 1994 |
|  2 |           2 | Jackie Brown | 1997 |
+----+-------------+--------------+------+
2 rows in set (0.01 sec)

mysql> select first_name, last_name from artist inner join role on artist.artist_id = role.id;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| John       | TRAVOLTA  |
| Bruce      | WILLIS    |
| Quentin    | TARANTINO |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> select first_name, last_name from artist inner join role on artist.role_id = role.id inner join film on role.film_id = film.id;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| John       | TRAVOLTA  |
| Bruce      | WILLIS    |
+------------+-----------+
2 rows in set (0.00 sec)
```
##### Use Bind Mounts to Customize Your MySQL Database in Docker
In this last section, we will simply mount the scripts inside the official MySQL Docker container.
```
$ docker run -d -p 3306:3306 --name my-mysql \
-v ~/my-mysql/sql-scripts:/docker-entrypoint-initdb.d/ \
-e MYSQL_ROOT_PASSWORD=supersecret \
-e MYSQL_DATABASE=company \
mysql
```
And we can verify again! Use the same steps as we did before: exec inside the container and check if the table and data exist!

This method is more flexible but it will be a little bit harder to distribute among the developers. They all need to store the scripts in a certain directory on their local machine and they need to point to that directory when they execute the docker run command.

