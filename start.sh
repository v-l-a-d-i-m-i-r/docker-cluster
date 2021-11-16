#!/bin/sh

set -e;

# Load .env
if [ -f .env ]; then
  os_env=$(env);
  dot_env=$(cat .env);

  export $(echo $dot_env | egrep -v '^#' | xargs);
  export $(echo $os_env | xargs);
fi


# Build time arguments
export ALPINE_VERSION='3.11.6';

# Run time environment variables
export PUID=$(id -u);
export PGID=$(id -g);
export DC_DATA_PATH=${DC_DATA_PATH:-'.data'};
export DC_VOLUMES_PATH=${DC_VOLUMES_PATH:-'.volumes'};
export DC_MPD_PORT='6600';
export DC_MPD_LOG_LEVEL='verbose'; # default, secure, or verbose
export DC_MPD_ALSA_DEVICE='hw:0,0';

# mkdir -p ${DC_DATA_PATH};
# mkdir -p ${DC_DATA_PATH}/Music;

# mkdir -p ${DC_VOLUMES_PATH};
# mkdir -p ${DC_VOLUMES_PATH}/filebrowser/db;


docker-compose down;
docker-compose up --build $@;
