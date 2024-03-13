FROM openjdk:17-alpine

LABEL description = "Jenkins+Docker CI/CD API"
ENV TZ=Asia/Seoul

EXPOSE 8181

# 젠킨스가 빌드한 결과물은 target 디렉토리에 배치된다.
COPY ./build/libs/docker-0.0.1-SNAPSHOT.jar /home/build/libs/docker-0.0.1-SNAPSHOT.jar

# 명령어가 실행되는 위치
WORKDIR /home/build/libs

# 컨테이너 실행 시 실행되는 명령어
ENTRYPOINT ["java","-jar","docker-0.0.1-SNAPSHOT.jar"]