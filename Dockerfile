FROM mysql
#mysql:5.7
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
ENV MYSQL_DATABASE company
#ENV MYSQL_ROOT_PASSWORD root
#ENV MYSQL_PASSWORD root
#ENV MYSQL_USER chao
EXPOSE 3306
