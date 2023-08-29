#!bin/bash
echo "***installing apache2"
sudo apt update -y
sudo apt install install apache2 -y
echo "***completed installing apache2"
echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html