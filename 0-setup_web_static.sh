#!/usr/bin/env bash
# sets up your web servers for the deployment of web_static
sudo apt update
sudo apt install -y nginx
mkdir -p "/data/web_static/releases/test/"
mkdir -p "/data/web_static/shared/"
touch "/data/web_static/releases/test/index.html"
ln -sf "/data/web_static/releases/test/" "/data/web_static/current"
cat >> "/data/web_static/releases/test/index.html" <<EOL
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
EOL
chown -R ubuntu:ubuntu "/data/"
sed -i '/server_name _;/ a\location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
/etc/init.d/nginx restart
