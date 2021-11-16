#!/bin/sh

set -ex;

# GROUP_NAME='smb-group';
# USER_NAME='smb';

# addgroup -g "${PGID}" "${GROUP_NAME}";
# adduser -u "${PUID}" -G "${GROUP_NAME}" -h /home/${USER_NAME} -D "${USER_NAME}";

config_file='/etc/samba/smb.conf';
temp_fle='/etc/samba/smb.conf.tmp';

envsubst < ${config_file} > ${temp_fle};
mv ${temp_fle} ${config_file};

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf;
