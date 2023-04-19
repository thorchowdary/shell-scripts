#!/bin/bash
sudo yum update -y 
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
sudo yum install telnet -y 
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx 
sudo systemctl start nginx 
wget https://www.free-css.com/assets/files/free-css-templates/download/page289/4uhost.zip
unzip 4uhost.zip
cd 4uhost-html 
rm -fr /usr/share/nginx/html/*
cp -r * /usr/share/nginx/html/
