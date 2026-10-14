FROM eclipse-temurin:17-jre

WORKDIR /app

ARG JAR_FILE=target/semcode.jar
COPY ${JAR_FILE} app.jar

USER 10001:10001

ENTRYPOINT ["java", "-jar", "app.jar"]
