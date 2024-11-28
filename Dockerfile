FROM maven:3.8.2-openjdk-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn clean package -DskipTests

FROM openjdk:11
COPY --from=build /usr/src/app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]