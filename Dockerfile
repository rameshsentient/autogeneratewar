FROM tomcat
RUN jar -cvf autosentientwar.war
CMD ["catalina.sh", "run"]
