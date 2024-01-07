FROM ubuntu:22.04

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && \
    apt-get -y install git && \
    apt-get -y install openjdk-17-jdk && \
    apt-get -y install maven

RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR /app/spring-petclinic
RUN ./mvnw package

EXPOSE 8080

CMD ["java", "-jar", "target/spring-petclinic-3.1.0-SNAPSHOT.jar"]
