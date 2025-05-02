# 📦 Proyecto: Clínica Odontológica

Este proyecto es una aplicación Spring Boot desarrollada en Java 17 para gestionar pacientes, odontólogos y turnos en una clínica. Se ejecuta en un contenedor Docker de manera sencilla para facilitar la portabilidad y despliegue.

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

### 3. Construir la imagen Docker

```bash
docker build -t clinica-odontologica .
```


### 4. Ejecutar el contenedor

```bash
docker run -p 8081:8081 --name clinica-container clinica-odontologica
```

Tu aplicación estará disponible en:

- http://localhost:8081

- Consola H2 (si está habilitada): http://localhost:8081/h2-console










