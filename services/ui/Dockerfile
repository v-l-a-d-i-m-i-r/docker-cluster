FROM nginx:1.21.3-alpine

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./healthcheck.sh ./healthcheck.sh

EXPOSE 80

HEALTHCHECK CMD [ "sh", "./healthcheck.sh" ]

ENTRYPOINT [ "sh", "./entrypoint.sh" ]
