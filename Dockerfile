FROM tomcat
RUN jar -cvf sentientautowar.war *
COPY sentientautowar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
