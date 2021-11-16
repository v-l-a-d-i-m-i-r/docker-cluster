# Build time arguments
export ALPINE_VERSION='3.11.6';
export REDIS_VERSION='6.0.1';
export POSTGRES_VERSION='12.2';
# export NEXTCLOUD_VERSION='18.0.4';
# export NGINX_VERSION='1.17.9';


# Run time environment variables
export PUID=$(id -u);
export PGID=$(id -g);
# export DC_DATABASE_NAME='nextcloud';
# export DC_DATABASE_USER='nextcloud';
# export DC_DATABASE_PASSWORD='nextcloud';
# export DC_NEXTCLOUD_ADMIN_USER='admin';
# export DC_NEXTCLOUD_ADMIN_PASSWORD='admin';
# export NEXTCLOUD_TRUSTED_DOMAINS='*';
export DC_DATA_PATH=${DC_DATA_PATH:-'.data'};
# export DC_DATA_PATH_SUBFOLDER="/${DC_NEXTCLOUD_ADMIN_USER}/files";
export DC_MPD_PORT='6600';
export DC_MPD_LOG_LEVEL='verbose'; # default, secure, or verbose
export DC_MPD_ALSA_DEVICE='hw:0,0';
