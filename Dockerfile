FROM tomcat:8.0-alpine
COPY . /app
WORKDIR /app
CMD ["catalina.sh", "run"]
