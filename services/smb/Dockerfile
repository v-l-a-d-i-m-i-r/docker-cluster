ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

RUN apk add --no-cache supervisor \
  # samba-common-tools \
  # samba-client \
  samba-server \
  gettext \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY ./config/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./config/smb.conf /etc/samba/smb.conf
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./scripts /etc/scripts

RUN chmod +x ./entrypoint.sh

RUN mkdir /media/storage

ENTRYPOINT [ "./entrypoint.sh" ]
