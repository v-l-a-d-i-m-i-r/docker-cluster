#!/bin/sh

mkdir -p /mpd/cache
mkdir -p /mpd/playlists

test -f /mpd/cache/state || touch /mpd/cache/state
test -f /mpd/cache/tag_cache || touch /mpd/cache/tag_cache
test -f /mpd/cache/sticker.sql || /mpd/cache/sticker.sql
# chmod -R 0774 /mpd/cache
# chown -R mpd: /mpd/cache

config_file='/etc/mpd.conf';
temp_fle='/etc/mpd.conf.tmp';

envsubst < ${config_file} > ${temp_fle};
mv ${temp_fle} ${config_file};

mpd \
  --no-daemon \
  --stdout \
  # --verbose \
  /etc/mpd.conf
