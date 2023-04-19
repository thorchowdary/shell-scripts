#!/bin/bash
yum update -y 
yum install java -y 
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
java --version 
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7-windows-x64.zip
unzip apache-tomcat-10.1.7-windows-x64.zip
rm -f *.zip
mv apache-tomcat-10.1.7 tomcat
cd tomcat/bin/
chmod 755 *.sh
sh startup.sh 
cd ..
wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/cluster/session_state/files/shoppingcart.zip
unzip shoppingcart.zip
mv shoppingcart.war webapps 
rm -f shoppingcart.zip
ps -ef | grep tomcat
netstat -anlp | grep -w "8080"
