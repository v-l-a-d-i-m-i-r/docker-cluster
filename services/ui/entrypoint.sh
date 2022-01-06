#!/bin/sh

set -e;

echo "${SETTINGS_JSON}" > /usr/share/nginx/html/settings.json;

nginx-debug -g 'daemon off;';
