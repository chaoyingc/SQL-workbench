docker run -d -p 3306:3306 --name my-mysql -v ~/my-mysql/sql-scripts:/docker-entrypoint-initdb.d/ -e MYSQL_ROOT_PASSWORD=supersecret -e MYSQL_DATABASE=company mysql

docker exec -it my-mysql bash
(password:supersecret)
mysql -u root -p
 show databases;
 use company
 show tables;
 select * from tablename;
