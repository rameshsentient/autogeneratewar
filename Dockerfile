FROM tomcat
RUN jar -cvf autosentientwar.war *
ADD autosentientwar.war /usr/local/tomcat/webapps/
ADD index.jsp /usr/local/tomcat/webapps/ROOT/
CMD ["catalina.sh", "run"]