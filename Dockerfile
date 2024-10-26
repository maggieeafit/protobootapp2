# Usa una imagen base de Java (OpenJDK 17 en este caso)
FROM openjdk:17-jdk-alpine

# Establece el directorio de trabajo en el contenedor
WORKDIR /protobootapp

# Copia el archivo JAR de la aplicación al contenedor
COPY target/protobootapp-0.0.1-SNAPSHOT.jar /app/protobootapp.jar

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 8080

# Define el comando para ejecutar la aplicación
CMD ["java", "-jar", "/app/protobootapp.jar"]

