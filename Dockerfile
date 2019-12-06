FROM tomcat
RUN jar -cvf /usr/local/tomcat/webapps/sentientautogenerate.war *
CMD ["catalina.sh", "run"]