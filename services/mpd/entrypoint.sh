#!/bin/sh

mkdir /mpd/cache
mkdir /mpd/playlists

touch /mpd/cache/tag_cache
touch /mpd/cache/state
touch /mpd/cache/sticker.sql
# chmod -R 0774 /mpd/cache
# chown -R mpd: /mpd/cache


config_file='/etc/mpd.conf';
temp_fle='/etc/mpd.conf.tmp';

envsubst < ${config_file} > ${temp_fle};
mv ${temp_fle} ${config_file};


cat /etc/mpd.conf


mpd \
  --no-daemon \
  --stdout \
  # --verbose \
  /etc/mpd.conf
