FROM alpine:3.11.2

COPY ./config/tasks.cron ./tasks.cron
COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
