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

Install manually:

OCC Web
ocDownloader

Dozzle
portainer
Alsamixer-webui
Groovebasin
