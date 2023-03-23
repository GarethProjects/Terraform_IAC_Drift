#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo "<h1>Test script deployed through Jenkins</h1>" | sudo tee /var/www/html/index.html
