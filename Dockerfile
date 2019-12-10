FROM tomcat
COPY . /app
WORKDIR /app
RUN wget http://mirror.olnevhost.net/pub/apache/maven/binaries/apache-maven-3.2.1-bin.tar.gz
CMD ["catalina.sh", "run"]

