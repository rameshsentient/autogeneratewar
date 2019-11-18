FROM tomcat
RUN jar -cvf sentientautowar.war *
ADD sentientautowar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
