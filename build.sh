#!/bin/sh

export ALPINE_VERSION='3.11.6';
export REDIS_VERSION='6.0.1';
export POSTGRES_VERSION='12.2';
export NEXTCLOUD_VERSION='18.0.4';
export NGINX_VERSION='1.17.9';


docker-compose build --parallel;
