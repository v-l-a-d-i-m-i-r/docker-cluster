FROM alpine:3.11.5

RUN apk add --no-cache supervisor \
  # samba-common-tools \
  # samba-client \
  samba-server \
  gettext \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY ./config/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./config/smb.conf /etc/samba/smb.conf
COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

RUN mkdir /media/storage

ENTRYPOINT [ "./entrypoint.sh" ]
