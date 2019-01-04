FROM maven:3.6.0-jdk-8 as build 

COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  

RUN mvn -f /usr/src/app/pom.xml clean install 

FROM openjdk:8-jre

WORKDIR /app
VOLUME ["/app"]

COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar app.jar 
COPY src/main/docker/start.sh start.sh
COPY src/main/docker/wait-for-it.sh wait-for-it.sh

RUN sh -c 'touch app.jar'

ENTRYPOINT ["./start.sh"]