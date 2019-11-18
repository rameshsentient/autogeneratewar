FROM tomcat
RUN jar -cvf sentientautowar.war *
CMD ["catalina.sh", "run"]
