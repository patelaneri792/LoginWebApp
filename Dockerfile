FROM ubuntu:12.04

MAINTAINER Kimbro Staken version: 0.1

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ARG WAR_FILE=target/*.war
# COPY ${JAR_FILE} app.jar
COPY  target/*.war LoginWebApp.war
# RUN apk add --no-cache curl tar bash


EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
#ENTRYPOINT ["java","-jar","/app.jar"]

#################################################################
FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/
EXPOSE 8090
CMD /usr/local/tomcat/bin/catalina.sh run
