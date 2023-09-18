# 베이스 이미지로 Ubuntu를 사용합니다.
FROM ubuntu:20.04

# 환경 변수 설정 (선택사항)
ENV DEBIAN_FRONTEND=noninteractive

# 시스템 업데이트 및 Redis 설치
RUN apt-get update && \
    apt-get install -y redis-server

# Redis 설정 파일 복사 (선택사항)
COPY redis.conf /etc/redis/redis.conf

# Redis 서버 시작
CMD ["redis-server"]