# Stage 1

FROM node:18-alpine as build-step

RUN mkdir -p /dist/sample-prj

WORKDIR /dist/sample-prj

COPY package.json /dist/sample-prj

RUN npm cache clean

RUN npm install

COPY . /dist/sample-prj

EXPOSE 4200

CMD ["npm", "start"]
