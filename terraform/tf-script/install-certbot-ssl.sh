#! /bin/bash

sudo systemctl stop nginx
sudo yum update -y
sudo wget -r --no-parent -A 'epel-release-*.rpm' https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/
sudo rpm -Uvh dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-*.rpm
sudo yum-config-manager --enable epel*
sudo yum install -y certbot 
sudo yum install -y python-certbot-nginx
sudo certbot certonly --standalone --debug -d full-timeenv.eba-h5bhs5w6.us-east-1.elasticbeanstalk.com --non-interactive --agree-tos -m gustavom@bandofcoders.com 
#sudo sed -i "s//$1" /tmp/template-nginx.conf > /tmp/nginx.conf
sudo sed -i "s|{i}|$1|g" /tmp/template-nginx.conf
sudo cp /tmp/template-nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx 
sudo crontab /tmp/crontab_config

