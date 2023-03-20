# Stage 1

FROM node:18-alpine as build-step

WORKDIR /dist/sample-prj

COPY package.json /dist/sample-prj

RUN npm install

COPY . /dist/sample-prj

CMD ["npm", "start"]

# # Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /dist/sample-prj /usr/share/nginx/html
