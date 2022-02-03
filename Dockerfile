FROM openjdk:8

RUN apt-get install debian-archive-keyring
RUN apt-key update
RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code

ADD src /home/code/src
ADD pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

ADD src /code/src
RUN ["mvn", "package"]

EXPOSE 4567
ENTRYPOINT ["/usr/local/openjdk-8/bin/java", "-jar", "target/review-service-api.jar"]
CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/review-service-api.jar"]