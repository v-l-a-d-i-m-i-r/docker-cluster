# FROM filebrowser/filebrowser:v2.17.2

# COPY config/.filebrowser.json .filebrowser.json

FROM alpine:3.14.2 as builder

RUN apk add --no-cache git nodejs npm go
RUN git clone --depth 1 --branch v2.17.2 https://github.com/filebrowser/filebrowser.git

WORKDIR /filebrowser

COPY ./patches ./patches
RUN git apply ./patches/v2.17.2.patch
RUN set -x && cd ./frontend && npm ci && npm run build && cd ../ && \
    go mod download -x && go build -x

FROM alpine:3.14.2

COPY --from=builder /filebrowser/filebrowser /filebrowser
COPY config/.filebrowser.json .filebrowser.json

ENTRYPOINT [ "./filebrowser" ]
