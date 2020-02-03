FROM node:10.16.0-alpine

RUN apk add --no-cache git python make gcc g++
RUN git clone https://github.com/Flood-UI/flood.git

WORKDIR /flood

RUN git checkout --detach 89934ab615d83d72b3db3d46e231e6a5c52f827a && \
    git branch && \
    npm ci

COPY config/config.js .

RUN npm run build

EXPOSE 80

CMD ["npm", "start"]
