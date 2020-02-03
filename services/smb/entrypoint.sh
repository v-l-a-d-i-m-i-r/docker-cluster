#!/bin/sh

envsubst < /etc/samba/smb.conf;

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
