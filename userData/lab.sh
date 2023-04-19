#!/bin/bash

# Check if Apache is installed
if ! rpm -qa | grep -qw httpd; then
    # Install Apache if it's not already installed
    yum update -y
    yum install -y httpd
fi
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
# Get metadata from the instance
ZONE=$(curl -s "http://169.254.169.254/latest/meta-data/placement/availability-zone")
REGION=$(echo ${ZONE} | sed 's/.$//')
INSTANCE_TYPE=$(curl -s "http://169.254.169.254/latest/meta-data/instance-type")

# Create the index.html file
cat > /var/www/html/index.html << EOF
<html>
<head>
  <title>Instance Metadata</title>
</head>
<body>
  <h1>Instance Metadata</h1>
  <ul>
    <li><b>Zone:</b> ${ZONE}</li>
    <li><b>Region:</b> ${REGION}</li>
    <li><b>Instance Type:</b> ${INSTANCE_TYPE}</li>
  </ul>
</body>
</html>
EOF

# Start the Apache web server to apply changes
systemctl start httpd
