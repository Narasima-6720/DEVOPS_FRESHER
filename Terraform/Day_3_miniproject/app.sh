#!/bin/bash

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1> I miss you Pranitha <h1>" > /var/www/html/index.html
echo "<h1> I never leave you alone and I always be with you<h2>" >> /var/www/html/index.html
