FROM tomcat
FROM maven
COPY . /app
WORKDIR /app
CMD ["catalina.sh", "run"]

