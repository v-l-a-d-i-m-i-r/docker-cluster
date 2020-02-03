#!/bin/sh

export DATABASE_USER='nextcloud';
export DATABASE_PASSWORD='nextcloud';
export NEXTCLOUD_ADMIN_USER='admin';
export NEXTCLOUD_ADMIN_PASSWORD='admin';
export NEXTCLOUD_TRUSTED_DOMAINS='*';

export DATA_PATH='.data';
export DATA_PATH_SUBFOLDER="/${NEXTCLOUD_ADMIN_USER}/files";


docker-compose down;
docker-compose up --build;
