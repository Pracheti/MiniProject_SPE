FROM ubuntu:latest
# Install OpenJDK 21 JRE
RUN apt-get update && apt-get install -y default-jdk
# Set the working directory in the container
WORKDIR /app
# Copy the JAR file into the container
COPY target/MT2023155_MiniProject-1.0-SNAPSHOT.jar /app/MT2023155_MiniProject.jar
# Command to run the JAR file
CMD ["java", "-jar", "MT2023155_MiniProject.jar"]