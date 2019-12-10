FROM tomcat
ADD target/autosentientwar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

