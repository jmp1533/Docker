FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y mysql-server
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
 
VOLUME ["/var/lib/mysql"]
 
EXPOSE 3306
 
CMD ["ubuntu_mysql"]