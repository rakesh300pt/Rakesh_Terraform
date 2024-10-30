FROM tomcat:9.0-jdk11-openjdk-slim
MAINTAINER Rocky 
RUN apt-get update
WORKDIR /usr/local/tomcat
COPY Amazon.war /usr/local/tomcat/webapps/
EXPOSE 8087
ENTRYPOINT ["catalina.sh", "run"]
