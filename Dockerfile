FROM maven:amazoncorretto as build
WORKDIR /java
COPY . .
RUN mvn clean install

FROM openjdk:8
WORKDIR /jarapp
COPY --from=build /java/target/*.jar spring-boot-docker.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/spring-boot-docker.jar"]
