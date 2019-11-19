# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER nikhil

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
# Install Java
RUN yum install java-1.8.0-openjdk-devel -y

# Install Apache Maven
RUN yum install maven -y
#sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
#sudo yum install -y apache-maven

# Install Apache TOMCAT
RUN wget https://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
RUN tar xvzf apache-tomcat-9.0.27.tar.gz
RUN rm -rf apache-tomcat-9.0.27.tar.gz
RUN cd apache-tomcat-9.0.27/
RUN cd bin
RUN chmod +x .starup.sh#ENTRYPOINT .startup.sh
#RUN ./startup.sh
#ADD sample.war /usr/local/tomcat/webapps/
EXPOSE 8080
RUN chmod +x catalina.sh
CMD ["catalina.sh", "run"]
