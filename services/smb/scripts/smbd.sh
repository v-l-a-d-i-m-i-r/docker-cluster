#!/bin/sh

set -e;

mkdir -p /var/lib/samba/private/

smbd \
  --foreground \
  --no-process-group \
  --log-stdout
