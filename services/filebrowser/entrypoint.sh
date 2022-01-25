#!/bin/sh

set -e;

PUID="${PUID:-1000}";
PGID="${PGID:-1000}";

usermod  -o -u "${PUID}" filebrowser;
groupmod -o -g "${PGID}" filebrowser;

mkdir -p ./db/ ./data/ ./cache/;
chown filebrowser:filebrowser ./db/ ./data/ ./cache/;

sudo -u filebrowser ./filebrowser \
  --address=0.0.0.0 \
  --port=80 \
  --root=./data/ \
  --database=./db/database.db \
  --noauth;
