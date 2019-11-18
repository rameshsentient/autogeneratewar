FROM tomcat
RUN mkdir /app
WORKDIR /app
RUN jar -cvf sentientautowar.war *
ADD sentientautowar.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
