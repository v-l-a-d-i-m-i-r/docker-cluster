#!/bin/sh

set -e;

renderTemplate() {
  ESC='$';
  HOST=$1;
  PORT=$2;

  cat <<EOF
  server {
    listen ${PORT};
    server_name ${ESC}http_host;

    location / {
      add_header 'Access-Control-Allow-Origin' '*';
      add_header 'Access-Control-Allow-Credentials' 'true';
      add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
      add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';

      if (${ESC}request_method = 'OPTIONS') {
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Credentials' 'true';
        add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
        add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';
        add_header 'Access-Control-Max-Age' 1728000;
        # add_header 'Content-Type' 'text/plain charset=UTF-8';
        add_header 'Content-Length' 0;
        return 204;
      }

      # add_header Referrer-Policy 'origin-when-cross-origin';
      add_header Content-Security-Policy 'frame-ancestors *';
      add_header X-Frame-Options 'ALLOW-FROM *';

      proxy_set_header X-Forwarded-Port ${ESC}server_port;
      proxy_set_header X-Forwarded-Proto ${ESC}http_x_forwarded_proto;
      proxy_set_header X-Forwarded-For ${ESC}proxy_add_x_forwarded_for;
      proxy_set_header Host ${ESC}host;
      proxy_set_header Referer "";
      proxy_set_header Origin "";

      proxy_hide_header Content-Security-Policy;
      proxy_hide_header X-Frame-Options;
      proxy_hide_header X-Content-Type-Options;
      proxy_hide_header x-xss-protection;
      proxy_hide_header Referrer-Policy;

      proxy_pass http://${HOST};
    }
  }
EOF
}

echo "${SETTINGS_JSON}" > /usr/share/nginx/html/settings.json;
touch /etc/nginx/nginx-redirects.conf;

echo "${SETTINGS_JSON}" | jq -c '.tabs[]' |
while IFS=$"\n" read -r tab; do
  port=$(echo "${tab}" | jq -r '.port');
  host=$(echo "${tab}" | jq -r '.subdomain');
  # host=$(echo "$c" | jq -r '.host')

  renderTemplate $host $port >> /etc/nginx/nginx-redirects.conf;
done

# cat /etc/nginx/nginx-redirects.conf;

nginx-debug -g 'daemon off;';
