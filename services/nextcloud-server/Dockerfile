ARG NEXTCLOUD_VERSION
FROM i386/nextcloud:${NEXTCLOUD_VERSION}-fpm-alpine

# Enables first run initialization
ENV NEXTCLOUD_UPDATE=1

RUN apk add --no-cache supervisor \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY ./config/supervisord.conf /etc/supervisor/supervisord.conf

COPY ./config/www-data.cron /etc/crontabs/www-data
# COPY ./config/root.cron /etc/crontabs/root

# For ocDownloader
RUN apk add --no-cache sudo aria2 curl php7-curl youtube-dl
COPY ./scripts/aria2.sh /etc/scripts/aria2.sh


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
