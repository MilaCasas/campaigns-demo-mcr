FROM eclipse-temurin:17.0.14_7-jdk-ubi9-minimal 
VOLUME /tmp 
EXPOSE 8080 
COPY *.jar app.jar 
ENTRYPOINT ["sh","-c", "java -jar /app.jar"] 
