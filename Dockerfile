FROM tomcat:8.0
COPY . /app
WORKDIR /app
CMD ["catalina.sh", "run"]

