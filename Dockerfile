FROM tomcat
ADD target/sparkjava-hello-world-1.0 /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]

