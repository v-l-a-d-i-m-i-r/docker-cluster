FROM alpine:3.11.5

# https://hub.docker.com/r/vimagick/mpd

RUN apk add --no-cache mpd gettext

COPY ./config/mpd.conf /etc/mpd.conf
COPY ./config/example.mp3 /mpd/music/example.mp3
COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
