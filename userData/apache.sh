#!/bin/bash 
sudo yum update -y
sudo yum install httpd -y 
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
sudo systemctl start httpd 
sudo systemctl enable httpd 
wget https://www.free-css.com/assets/files/free-css-templates/download/page288/meetup.zip
unzip meetup.zip
cd meetup
cp -r * /var/www/html/
netstat -anlp | grep -w "80" 
ps -ef | grep httpd 







