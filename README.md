# 📦 Proyecto: Clínica Odontológica

Este proyecto es una aplicación Spring Boot desarrollada en Java 21 para gestionar pacientes, odontólogos y turnos en una clínica. Se ejecuta en un contenedor Docker de manera sencilla para facilitar la portabilidad y despliegue.

---

## 🚀 Cómo correr la aplicación con Docker

Sigue los siguientes pasos para levantar la aplicación dentro de un contenedor Docker.

### 1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/clinica-odontologica.git
cd clinica-odontologica
```

### 2. Compilar el proyecto y generar el .jar

```bash
./mvnw clean package
```

Esto generará el archivo:

```bash
target/clinica-odontologica-0.0.1-SNAPSHOT.jar
```

### 3. Ejecutar con Docker Compose

```bash
docker-compose up --build
```


### 4. Accedé a la aplicación:

- Aplicación: http://localhost:8081

- Consola H2: http://localhost:8081/h2-console

  - JDBC URL: jdbc:h2:file:/data/clinica-odontologica

  - Usuario: tu_usuario

  - Contraseña: tu_contraseña


La aplicación estará disponible en:

- http://localhost:8081

- Consola H2 (si está habilitada): http://localhost:8081/h2-console

---

## ⚙️ Archivos necesarios para Docker

Asegúrate de tener los siguientes archivos en tu proyecto (estos deben mantenerse en el repositorio):

Dockerfile

```docker
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/clinica-odontologica-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]

```

## 🛑 Archivos ignorados (.gitignore)

Estos archivos/directorios se generan en tiempo de compilación y no deben subirse al repositorio:

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


## 📄 application.properties (desarrollo)

El archivo src/main/resources/application.properties debería contener configuraciones para entorno de desarrollo, por ejemplo:

```properties
# LOGGING
logging.level.root=INFO
logging.level.org.springframework.web=INFO
logging.level.org.hibernate=ERROR
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} [%highlight(%-5level)] [%cyan(%thread)] %magenta(%logger{15}) - %msg%n

# SERVIDOR
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

# CONEXION A BASE DE DATOS H2 PERSISTENTE EN CONTENEDOR
spring.datasource.url=jdbc:h2:file:/data/clinica-odontologica
spring.datasource.driver-class-name=org.h2.Driver
spring.datasource.username=your_username
spring.datasource.password=your_password

```



