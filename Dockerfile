FROM node:18-alpine as build-step

WORKDIR /app

COPY package.json ./

RUN npm cache clean

RUN npm install

COPY ..

EXPOSE 4200

CMD ["npm", "start"]
