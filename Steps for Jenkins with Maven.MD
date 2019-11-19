# Configure maven to build java code
1) Install Maven - yum install maven ( host where you want to copy java codes and run as application, it would be generally Jenkins slave)
2) Make usre Java JDK is installed ( this may be alreday installed as part of Jenkins slave configuration)
# If yum install not working use below steps
1) https://github.com/splunklearners/Java-Mavenproject/blob/master/installmaven.txt

# Download tomcat and install
1) wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
2) gunzip apache-tomcat-9.0.27.tar.gz
3) tar -xvf apache-tomcat-9.0.27.tar
4) cd apache-tomcat-9.0.27
5) cd bin
6) ./startup.sh
7) ./shutdown.sh
8) ./startup.sh
# Post build task script
1) sudo cd /root/apache-tomcat-9.0.27/bin
2) sudo /root/apache-tomcat-9.0.27/bin/shutdown.sh
3) sudo cp -pr  /home/jenkins-slave/workspace/mavenproject/target/*.war /root/apache-tomcat-9.0.27/webapps
4) sudo /root/apache-tomcat-9.0.27/bin/startup.sh
