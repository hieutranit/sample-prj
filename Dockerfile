# Stage 1

FROM node:18-alpine as build-step

RUN mkdir -p /dist/sample-prj

WORKDIR /dist/sample-prj

COPY package.json /dist/sample-prj

RUN npm cache clean

RUN npm install

COPY . /dist/sample-prj

RUN npm run build --prod

 
# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /dist/sample-prj /usr/share/nginx/html