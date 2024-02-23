FROM ubuntu:20.04

# MySQL 설치 및 초기 설정
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-8.0

# MySQL 서버의 바인딩 주소를 변경하여 원격 접속을 허용합니다.
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf

# /docker-entrypoint-initdb.d/ 디렉토리를 생성합니다.
RUN mkdir -p /docker-entrypoint-initdb.d/

# MySQL 초기 설정 스크립트를 직접 작성합니다.
RUN echo "CREATE USER 'testuser'@'%' IDENTIFIED WITH mysql_native_password BY '1234';" > /docker-entrypoint-initdb.d/init.sql
RUN echo "GRANT ALL PRIVILEGES ON *.* TO 'testuser'@'%';" >> /docker-entrypoint-initdb.d/init.sql
RUN echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

# 스크립트를 수동으로 실행합니다.
RUN service mysql start && mysql < /docker-entrypoint-initdb.d/init.sql

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["mysqld"]


# docker build -t db/mysql:8.0 .
# docker run --name mysql_8.0 -p 3306:3306 -d db/mysql:8.0

# mysql -u root -p