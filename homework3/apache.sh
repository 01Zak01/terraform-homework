#!/bin/bash
sudo yum update 
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo Hello World > /var/www/html/index.html