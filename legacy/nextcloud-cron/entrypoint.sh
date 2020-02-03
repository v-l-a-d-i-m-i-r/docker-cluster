#!/bin/sh

crontab /tasks.cron
crond -f -L /dev/stdout
