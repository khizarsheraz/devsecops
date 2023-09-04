FROM adoptopenjdk/openjdk8:alpine-slim
EXPOSE 9999
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]