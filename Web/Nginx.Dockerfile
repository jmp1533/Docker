# 베이스 이미지 설정
FROM ubuntu:20.04

# 패키지 업데이트 및 Nginx 설치
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/nginx.conf

# Nginx를 실행하기 위한 사용자 및 그룹 추가
RUN adduser --system --no-create-home --disabled-login --group nginx

# 포트 오픈 (기본 HTTP 포트 80)
EXPOSE 80

# Nginx 서비스 실행
CMD ["nginx", "-g", "daemon off;"]

# [nginx.conf]
#user nginx;
#worker_processes auto;
#pid /run/nginx.pid;
#include /etc/nginx/modules-enabled/*.conf;
#
#events {
#    worker_connections 768;
#    # multi_accept on;
#}
#
#http {
#    ##
#    # 기본 설정
#    ##
#
#    include /etc/nginx/mime.types;
#    default_type application/octet-stream;
#
#    ##
#    # 로그 포맷
#    ##
#
#    access_log /var/log/nginx/access.log;
#    error_log /var/log/nginx/error.log;
#
#    ##
#    # 기본 설정
#    ##
#
#    sendfile on;
#    # tcp_nopush on;
#    # tcp_nodelay on;
#    keepalive_timeout 65;
#    types_hash_max_size 2048;
#
#    # 설정 파일 포함
#    include /etc/nginx/conf.d/*.conf;
#    include /etc/nginx/sites-enabled/*;
#}

# docker build -t nginx/nginx-server:latest .
# docker run --name nginx-server -p 80:80 -d nginx/nginx-server:latest
