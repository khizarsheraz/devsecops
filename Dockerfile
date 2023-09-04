FROM adoptopenjdk/openjdk8:alpine-slim
EXPOSE 9999
ARG JAR_FILE=target/*.jar
ENTRYPOINT ["java","-jar","app.jar"]