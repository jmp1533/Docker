FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-8.0

RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
 
VOLUME ["/var/lib/mysql"]
 
EXPOSE 3306
 
CMD ["mysqld"]


# docker build -t db/mysql:latest .
# docker run --name mysql -p 3306:3306 -d db/mysql:latest

# mysql -u root -p