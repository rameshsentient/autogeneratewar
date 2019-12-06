FROM tomcat:9.0-jre8-alpine
ADD target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

