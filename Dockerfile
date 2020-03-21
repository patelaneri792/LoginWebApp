FROM ubuntu:12.04

MAINTAINER Kimbro Staken version: 0.1

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
COPY  target/*.jar app.jar
# RUN apk add --no-cache curl tar bash


EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
#ENTRYPOINT ["java","-jar","/app.jar"]
