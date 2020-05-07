#!/bin/sh

set -e;

export DC_DATABASE_NAME='nextcloud';
export DC_DATABASE_USER='nextcloud';
export DC_DATABASE_PASSWORD='nextcloud';
export DC_NEXTCLOUD_ADMIN_USER='admin';
export DC_NEXTCLOUD_ADMIN_PASSWORD='admin';
# export NEXTCLOUD_TRUSTED_DOMAINS='*';

export DC_DATA_PATH=${DC_DATA_PATH:-'.data'};
export DC_DATA_PATH_SUBFOLDER="/${DC_NEXTCLOUD_ADMIN_USER}/files";

export MPD_PORT='6600';

docker-compose down;
sh "$(dirname $0)/build.sh";
docker-compose up;
