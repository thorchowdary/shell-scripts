#!/bin/bash
aws s3 cp s3://ktkt07/dev-practice.pem .
chmod 400 dev-practice.pem
pwd
choice = 6
ls -ltrh
echo "setting up the apache server"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo yum install httpd -y"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo systemctl enable httpd"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo systemctl start httpd"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "ps -ef|grep httpd"
echo "-------------------------------------"
echo"coping the package from s3 and unzipping"
aws s3 cp s3://ktkt07/Jenkins-6.zip .
unzip Jenkins-6.zip
echo"copying unzip file to var/www/html"
sudo scp -i dev-practice.pem index.html ec2-user@172.31.8.125:/home/ec2-user
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo cp index.html /var/www/html"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo systemctl stop httpd"
ssh -i dev-practice.pem ec2-user@172.31.8.125 "sudo systemctl start httpd"
rm -rf dev-practice.pem
rm -rf jenkins*
rm -rf index*
