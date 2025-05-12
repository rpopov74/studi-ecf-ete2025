# Étape 1 : Build et tests
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

# Compile le projet et exécute les tests
RUN mvn clean verify

# Étape 2 : Image d'exécution
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copie uniquement le JAR généré
COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]