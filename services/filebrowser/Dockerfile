FROM alpine:3.14.2 as builder

RUN apk add --no-cache git nodejs npm go
RUN git clone --depth 1 --branch v2.17.2 https://github.com/filebrowser/filebrowser.git

WORKDIR /filebrowser

COPY ./patches ./patches
RUN git apply ./patches/v2.17.2.patch
RUN set -x && cd ./frontend && npm ci && npm run build && cd ../ && \
    go mod download -x && go build -x

FROM alpine:3.14.2

ARG USER=filebrowser
ARG GROUP=filebrowser

RUN apk add --no-cache sudo shadow curl

RUN addgroup "${GROUP}" \
  && adduser -G "${GROUP}" -h /home/"${USER}" -D "${USER}" \
  && chmod 755 /home/"${USER}"

WORKDIR /home/"${USER}"

COPY --from=builder /filebrowser/filebrowser ./filebrowser
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./healthcheck.sh ./healthcheck.sh

RUN chmod -R 755 .
RUN chown -R "${USER}":"${GROUP}" .

EXPOSE 80

HEALTHCHECK CMD [ "sh", "./healthcheck.sh" ]

ENTRYPOINT [ "sh", "./entrypoint.sh" ]
