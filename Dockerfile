FROM openjdk:8

ADD target/review-service-api.jar review-service-api.jar

ENTRYPOINT ["java", "-jar","review-service-api.jar"]