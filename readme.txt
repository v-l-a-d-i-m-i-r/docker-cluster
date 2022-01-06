https://github.com/nextcloud/docker/issues/236
https://github.com/nextcloud/docker/issues/70

https://hub.docker.com/r/linuxserver/nextcloud

https://docs.nextcloud.com/server/9/admin_manual/configuration_server/occ_command.html#file-operations-label




In ownCloud and the early nextcloud versions there was a script for setting permissions... now they recommend this:

chown -R www-data:www-data nextcloud

find nextcloud/ -type d -exec chmod 750 {} ;

find nextcloud/ -type f -exec chmod 640 {} ;

https://docs.nextcloud.com/server/12/admin_manual/maintenance/manual_upgrade.html



docker create \
  --name=nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 443:443 \
  -v /path/to/appdata:/config \
  -v path/to/data:/data \
  --restart unless-stopped \
  linuxserver/nextcloud


docker run --rm -ti \
  --name=nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 443:443 \
  -v $(pwd)/vol:/config \
  -v $(pwd)/vol:/data \
  linuxserver/nextcloud

VNC
https://github.com/pingod/alpine-xfce4-novnc
docker run --rm \
  -p 5900:5900 -p 9000:6080 \
  --name alpine-xfce-vnc \
  --hostname alpine \
  edgelevel/alpine-xfce-vnc

Install manually:

OCC Web
ocDownloader

Dozzle
portainer
Alsamixer-webui
Groovebasin


filebrowsers
https://github.com/filebrowser/filebrowser
https://github.com/prasathmani/tinyfilemanager (127.0.0.1 not localhost)
https://github.com/coderaiser/cloudcmd
https://github.com/Studio-42/elFinder
https://filerun.com/
https://github.com/topics/file-explorer

Sharing
https://github.com/ehough/docker-nfs-server


Cookies
https://bugs.chromium.org/p/chromium/issues/detail?id=1062162

Nginx
https://www.nginx.com/blog/tuning-nginx/

# https://stackoverflow.com/questions/35069027/docker-wait-for-postgresql-to-be-running
# RETRIES=5

# until psql -h $PG_HOST -U $PG_USER -d $PG_DATABASE -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
#   echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
#   sleep 1
# done


RUN addgroup $GROUP \
  && adduser -G $GROUP -h /home/$USER -D $USER \
  && chmod 777 /home/$USER
  # && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
  # && chmod 0440 /etc/sudoers.d/$USER


DC_MPD_PORT=6600 docker-compose config 2>/dev/null | yq -r '.services | values[].image' | grep -v 'null'


# build
DC_DATA_PATH='.data' DC_CONFIG_PATH='.volumes' docker-compose build --parallel;

# push
DC_DATA_PATH='.data' DC_CONFIG_PATH='.volumes' docker-compose config 2>/dev/null | yq -r '.services | values[].image' | grep -v 'null' | xargs -I '{}' -P 1 sh -ce 'docker save {} | gzip | pv | ssh vladimir@lenovo-s10 docker load';

# run
DOCKER_HOST="ssh://vladimir@lenovo-s10" DC_DATA_PATH='/data/nas-data' DC_CONFIG_PATH='/data/nas-config' PUID='1000' PGID='984' DC_MPD_PORT='6600' DC_MPD_LOG_LEVEL='verbose' DC_MPD_ALSA_DEVICE='hw:0,0' docker-compose up -d;
