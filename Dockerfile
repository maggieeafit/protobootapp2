# Usa una imagen base de Maven para compilar el JAR
FROM maven:3.8.4-openjdk-17 AS build

# Copia el código fuente y pom.xml
COPY . /app
WORKDIR /app

# Compila el proyecto y genera el JAR
RUN mvn clean package -DskipTests

# Usa una imagen de OpenJDK para ejecutar la aplicación
FROM openjdk:17-jdk-alpine

# Copia el JAR compilado desde la imagen anterior
COPY --from=build /app/target/protobootapp-0.0.1-SNAPSHOT.jar /app/protobootapp.jar

# Expone el puerto
EXPOSE 8080

# Ejecuta la aplicación
CMD ["java", "-jar", "/app/protobootapp.jar"]

