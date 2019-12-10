FROM tomcat
ADD autosentientwar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

