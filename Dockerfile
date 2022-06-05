# syntax=docker/dockerfile:1

FROM node:16-alpine as base

WORKDIR /home/node/app

COPY . .

FROM base as developer

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

FROM base as production

ENV NODE_ENV=production
ENV NODE_PATH=./build

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

CMD [ "node", "dist/index.js" ]