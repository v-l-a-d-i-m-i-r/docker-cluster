#!/bin/sh

export DC_DATABASE_USER='nextcloud';
export DC_DATABASE_PASSWORD='nextcloud';
export DC_NEXTCLOUD_ADMIN_USER='admin';
export DC_NEXTCLOUD_ADMIN_PASSWORD='admin';
# export NEXTCLOUD_TRUSTED_DOMAINS='*';

export DC_DATA_PATH=${DC_DATA_PATH};
export DC_DATA_PATH_SUBFOLDER="/${DC_NEXTCLOUD_ADMIN_USER}/files";


docker-compose down;
docker-compose up --build;
