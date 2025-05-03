# 📦 Project: Dental Clinic

This project is a Spring Boot application developed in Java 21 to manage patients, dentists and shifts in a clinic. It runs in a Docker container in a simple way to facilitate portability and deployment.

---

## 🚀 How to run the application with Docker

Follow the steps below to get the application up inside a Docker container.

```bash
git clone https://github.com/tu-usuario/clinica-odontologica.git
cd clinica-odontologica
```

### 2. Compile the project and generate the .jar

```bash
./mvnw clean package
```

This will generate the file:

```bash
target/clinica-odontologica-0.0.1-SNAPSHOT.jar
```

### 3. Running with Docker Compose

```bash
docker-compose up --build
```


### 4. Access the application:

- Application: http://localhost:8081

- Console H2: http://localhost:8081/h2-console

  - JDBC URL: jdbc:h2:file:/data/clinica-odontologica

  - User: your_user

  - Password: your_pasword


The application will be available in:

- http://localhost:8081

- Console H2 (if enabled): http://localhost:8081/h2-console

---

## ⚙️ Files needed for Docker

Make sure you have the following files in your project (these must be kept in the repository):

Dockerfile

```docker
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/clinica-odontologica-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]

```

## 🛑 Ignored files (.gitignore)

These files/directories are generated at compile time and should not be uploaded to the repository:

```bash
/target/
/*.iml
/.idea/
/*.jar
/logs/
/*.log

```

## docker-compose

```docker
version: "3.8"
services:
  app:
    build: .
    ports:
      - "8081:8081"
    volumes:
      - ./dbdata:/data
```


## 📄 application.properties (development)

The src/main/resources/application.properties file should contain settings for the development environment, for example:

```properties
# LOGGING
logging.level.root=INFO
logging.level.org.springframework.web=INFO
logging.level.org.hibernate=ERROR
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} [%highlight(%-5level)] [%cyan(%thread)] %magenta(%logger{15}) - %msg%n

# SERVER
server.port=8081

# JPA / HIBERNATE
spring.jpa.hibernate.ddl-auto=create
spring.jpa.show-sql=false
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect

# H2
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console
spring.h2.console.settings.web-allow-others=true

# CONNECTION TO PERSISTENT H2 DATABASE IN CONTAINER
spring.datasource.url=jdbc:h2:file:/data/clinica-odontologica
spring.datasource.driver-class-name=org.h2.Driver
spring.datasource.username=your_username
spring.datasource.password=your_password

```



