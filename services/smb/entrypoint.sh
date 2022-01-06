#!/bin/sh

set -ex;

# config_file='/etc/samba/smb.conf';
# temp_fle='/etc/samba/smb.conf.tmp';

# envsubst < ${config_file} > ${temp_fle};
# mv ${temp_fle} ${config_file};

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf;
