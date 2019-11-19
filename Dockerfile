# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER nikhil

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
# Install Java
RUN sudo yum install java-1.8.0-openjdk

# Install Apache Maven
RUN sudo yum install maven -y
#sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
#sudo yum install -y apache-maven
#mvn --version

# Install Apache TOMCAT
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
RUN gunzip apache-tomcat-9.0.27.tar.gz
RUN tar -xvf apache-tomcat-9.0.27.tar
RUN cd apache-tomcat-9.0.27
RUN cd bin
RUN ./startup.sh
RUN ./shutdown.sh
RUN ./startup.sh





