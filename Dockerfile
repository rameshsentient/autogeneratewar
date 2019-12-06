FROM tomcat
RUN jar -cvf autosentientwar.war *
ADD autosentientwar.war * /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]