ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

# https://hub.docker.com/r/vimagick/mpd

RUN apk add --no-cache mpd gettext

COPY ./config/mpd.conf /etc/mpd.conf
COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
