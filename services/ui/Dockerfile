FROM nginx:1.21.3-alpine

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html
COPY config/settings.json /usr/share/nginx/html/settings.json

COPY ./healthcheck.sh ./healthcheck.sh

EXPOSE 80

HEALTHCHECK CMD [ "sh", "./healthcheck.sh" ]
