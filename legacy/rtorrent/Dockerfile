FROM alpine:3.10

RUN adduser -D rtorrent

COPY ./config/.rtorrent.rc /home/rtorrent/.rtorrent.rc


RUN apk add --update rtorrent && \
    mkdir -p /data/.session && \
    chown -R rtorrent:rtorrent /data

USER rtorrent
WORKDIR /home/rtorrent

COPY entrypoint.sh .

VOLUME ["/data"]
EXPOSE 49184

CMD ["sh", "entrypoint.sh"]
