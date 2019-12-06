FROM tomcat
RUN jar -cvf sentientautogenerate.war *
CMD ["catalina.sh", "run"]