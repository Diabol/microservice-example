FROM diabol/slim:server-base-java7
ADD target/microservice-1.0-SNAPSHOT.jar /microservice.jar
EXPOSE 8080
ENTRYPOINT /usr/java/jdk1.8.0_05/bin/java -jar microservice.jar server

