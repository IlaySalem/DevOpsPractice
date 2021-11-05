#!/bin/bash
echo "*** INSTALLING NGINX"
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
echo "*** COMPLITED INSTALLATION NGINX"