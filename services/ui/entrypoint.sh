#!/bin/sh

settings=$(cat /usr/share/nginx/html/settings.json);
echo $settings;

sed -i 's/<%SETTINGS%>/'${settings}'/g' /usr/share/nginx/html/index.html;

cat /usr/share/nginx/html/index.html;

nginx -g daemon off;
