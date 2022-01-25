# https://hub.docker.com/r/vimagick/mpd
# https://github.com/woahbase/alpine-mpd
# https://johnsiu.com/blog/alpine-mpd-lite/
FROM alpine:3.11.6

ARG USER=mpd
ARG GROUP=mpd

ENV NODE_PATH="/usr/lib/node_modules/"

RUN apk add --no-cache sudo shadow mpd alsa-utils \
    && addgroup "${GROUP}" \
    && adduser "${USER}" "${GROUP}" \
    && adduser "${USER}" audio

COPY ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "sh", "./entrypoint.sh" ]
