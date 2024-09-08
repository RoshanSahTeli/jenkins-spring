FROM openjdk:latest

EXPOSE 8080

ADD target/spring-integration.jar spring-integration.jar

ENTRYPOINT [ "java","-jar","spring-integration.jar" ]