FROM node:18-alpine as build-stage

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY ./ /app/

RUN npm run build -- --output-path=./dist/out

FROM nginx:latest
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html