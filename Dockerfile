# Build stage
FROM gradle:8.5-jdk17 AS build
WORKDIR /app
COPY . .
# Clear cache and build
RUN gradle clean build --no-daemon -x test

# Run stage
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]

#İmage oluştur
#docker build -t furkantest-app .

#run it detached    
#docker run -d -p 8081:8081 furkantest-app