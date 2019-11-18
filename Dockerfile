FROM tomcat
RUN jar -cvf sentientautowar.war *
ADD /usr/local/tomcat/sentientautowar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
