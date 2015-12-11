FROM tomcat:latest
MAINTAINER Dean Howell

RUN groupadd -r davmail
RUN useradd -r -g davmail davmail

RUN echo '<role rolename="manager-gui"/>' >> \
  /usr/local/conf/tomcat-users.xml

RUN echo '<user username="davmail" password="davmail" roles="manager-gui"/>' \
  >> /usr/local/conf/tomcat-users.xml

RUN cd /usr/local/tomcat/webapps/
RUN wget https://s3-us-west-2.amazonaws.com/davmail-current/davmail-current.war

EXPOSE 8080
EXPOSE 1080
EXPOSE 1143
EXPOSE 1389
EXPOSE 1110
EXPOSE 1025

WORKDIR /usr/local/davmail USER davmail
ENTRYPOINT ["/usr/local/bin/davmail.sh"]
