FROM tomcat
COPY . /app
RUN jar -cvf autosentientwar.war *
CMD ["catalina.sh", "run"]