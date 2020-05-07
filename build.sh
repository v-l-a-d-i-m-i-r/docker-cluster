#!/bin/sh

export ALPINE_VERSION='3.11.5';
export REDIS_VERSION='5.0.8';
export POSTGRES_VERSION='12.1';
export NEXTCLOUD_VERSION='17.0.2';
export NGINX_VERSION='1.17.9';


docker-compose build;
