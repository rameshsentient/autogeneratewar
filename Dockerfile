FROM tomcat
FROM maven:3.5-jdk-8-alpine
COPY . /app
WORKDIR /app
CMD ["catalina.sh", "run"]

