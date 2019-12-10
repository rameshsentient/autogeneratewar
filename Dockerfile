FROM tomcat
FROM maven:3.5-jdk-8-alpine
RUN mvn package
CMD ["catalina.sh", "run"]

