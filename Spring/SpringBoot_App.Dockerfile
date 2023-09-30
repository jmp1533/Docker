# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/*.jar /app/프로젝트명.jar

# Specify the command to run on container startup
CMD ["java", "-jar", "/app/프로젝트명.jar"]