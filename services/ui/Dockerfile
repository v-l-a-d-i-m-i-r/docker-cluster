FROM nginx:1.21.3-alpine

# COPY config/default.conf /etc/nginx/conf.d/default.conf
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html
COPY config/settings.json /usr/share/nginx/html/settings.json
# COPY ./entrypoint.sh ./entrypoint.sh

# RUN chmod +x ./entrypoint.sh

# RUN mkdir /media/storage

# ENTRYPOINT [ "./entrypoint.sh" ]
