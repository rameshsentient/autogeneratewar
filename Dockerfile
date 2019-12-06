FROM tomcat
RUN jar -cvf autosentientwar.war *
COPY autosentientwar.war
WORKDIR /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]