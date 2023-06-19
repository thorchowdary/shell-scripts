#1/bin/bash
sudo yum install docker -y
sudo systemctl start docker 
sudo docker pull jenkins
sudo docker run -d -p 1000:8080 jenkins
