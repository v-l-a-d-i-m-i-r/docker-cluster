FROM i386/nextcloud:18.0.3-fpm-alpine

# Enables first run initialization
ENV NEXTCLOUD_UPDATE=1

RUN apk add --no-cache supervisor \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY ./config/supervisord.conf /etc/supervisor/supervisord.conf

COPY ./config/www-data.cron /etc/crontabs/www-data
# COPY ./config/root.cron /etc/crontabs/root



CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
