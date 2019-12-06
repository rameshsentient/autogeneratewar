FROM maven:3.5-jdk-8-alpine
RUN mvn package
FROM tomcat
ADD  target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

