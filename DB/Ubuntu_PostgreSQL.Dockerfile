# 베이스 이미지 설정
FROM ubuntu:20.04

# 환경 변수 설정: Non-Interactive 모드로 tzdata 설정 및 Asia 시간대 선택
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# 패키지 업데이트 및 설치
RUN apt-get update && \
    apt-get install -y postgresql

# 포트 열기 (옵션: PostgreSQL에 대한 기본 포트는 5432입니다)
EXPOSE 5432

# 컨테이너 실행 시 PostgreSQL 자동 실행
CMD ["service", "postgresql", "start"]

# Docker 빌드
#docker build -t db/postgresql:latest .
# Docker 실행
#docker run --name postgresql -p 5432:5432 -d db/postgresql:latest