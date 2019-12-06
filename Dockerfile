FROM tomcat
RUN jar -cvf /usr/local/tomcat/webapps/autosentientwar.war *
ADD autosentientwar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]