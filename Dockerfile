FROM maven:3.5-jdk-8-alpine
FROM tomcat:8.0
RUN mvn clean install
RUN mvn package
COPY target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

