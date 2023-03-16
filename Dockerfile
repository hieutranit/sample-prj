FROM node:18-alpine as build-step

RUN mkdir -p /dist/sample-prj

WORKDIR /dist/sample-prj

COPY package.json /dist/sample-prj

RUN npm install

COPY . /dist/sample-prj

RUN npm run build --prod
