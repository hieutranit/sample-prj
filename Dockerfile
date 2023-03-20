# # Stage 1

FROM node:18-alpine as build-step

WORKDIR /app

COPY package.json /app/

RUN npm install

COPY . /app/

CMD ["npm", "start"]

# # Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step/app/dist/out/ /usr/share/nginx/html