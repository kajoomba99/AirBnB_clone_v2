#!/usr/bin/env bash
# sets up your web servers for the deployment of web_static
sudo apt update
sudo apt install -y nginx
ufw allow 'Nginx HTTP'
mkdir -p "/data/web_static/releases/test/"
mkdir -p "/data/web_static/shared/"
touch "/data/web_static/releases/test/index.html"
cat >> "/data/web_static/releases/test/index.html" <<EOL
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
EOL
ln -sf "/data/web_static/releases/test/" "/data/web_static/current"
chown -R ubuntu:ubuntu /data
sed -i '/server_name _;/ a\location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
/etc/init.d/nginx restart
