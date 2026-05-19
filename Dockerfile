FROM eclipse-temurin:8-jre-alpine
COPY target/DemoIC-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]