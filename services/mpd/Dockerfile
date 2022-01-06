# https://hub.docker.com/r/vimagick/mpd
# https://github.com/woahbase/alpine-mpd
# https://johnsiu.com/blog/alpine-mpd-lite/
FROM alpine:3.11.6

ARG USER=mpd
ARG GROUP=mpd

ENV NODE_PATH="/usr/lib/node_modules/"

RUN apk add --no-cache sudo shadow mpd alsa-utils gettext nodejs npm \
    && npm install -g --unsafe-perm shelljs@0.8.4 \
    && addgroup "${GROUP}" \
    && adduser "${USER}" "${GROUP}" \
    && adduser "${USER}" audio

COPY ./config/mpd.conf /etc/mpd.conf
COPY ./entrypoint.js ./entrypoint.js

ENTRYPOINT [ "node", "./entrypoint.js" ]
