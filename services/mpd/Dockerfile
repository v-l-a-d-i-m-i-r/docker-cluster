ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

# https://hub.docker.com/r/vimagick/mpd

ENV NODE_PATH="/usr/lib/node_modules/"

RUN apk add --no-cache mpd alsa-utils gettext nodejs npm
RUN npm install -g --unsafe-perm shelljs@0.8.4

COPY ./config/mpd.conf /etc/mpd.conf
COPY ./entrypoint.js ./entrypoint.js

RUN chmod +x ./entrypoint.js

ENTRYPOINT [ "./entrypoint.js" ]
