FROM oven/bun:1 

WORKDIR /usr/src/app

RUN apt-get update -y && apt-get install -y openssl

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json 
COPY ./package-lock.json ./package-lock.json
COPY ./turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket

RUN bun install 

RUN bun run db:generate

EXPOSE 8080

CMD [ "bun","run","start:websocket" ]