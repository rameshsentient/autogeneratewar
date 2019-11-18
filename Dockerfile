FROM tomcat
RUN jar -cvf /tmp/sentientautowar.war *
CMD ["catalina.sh", "run"]