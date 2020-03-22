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
FROM tomcat:latest
RUN mkdir /opt/tomcat
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.33/bin/apache-tomcat-9.0.33.tar.gz /tmp 
RUN cd /tmp && tar xvfz apache-tomcat-9.0.33.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.33/* /opt/tomcat/
EXPOSE 8090
CMD /opt/tomcat/catalina.sh run
