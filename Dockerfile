# Etapa 1: Build
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:21
WORKDIR /app

COPY --from=build /app/target/clinica-odontologica-0.0.1-SNAPSHOT.jar app.jar

# Puerto usado en application.properties
EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
