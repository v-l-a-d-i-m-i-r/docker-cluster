FROM nginx:1.21.3-alpine

RUN apk add --no-cache jq

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./healthcheck.sh ./healthcheck.sh

EXPOSE 80

HEALTHCHECK CMD [ "sh", "./healthcheck.sh" ]

ENTRYPOINT [ "sh", "./entrypoint.sh" ]
