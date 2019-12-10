FROM tomcat
COPY . /app
WORKDIR /app
CMD ["catalina.sh", "run"]

