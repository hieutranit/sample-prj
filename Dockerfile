# Stage 1

FROM node:18-alpine as build-step

WORKDIR /dist/sample-prj

COPY package.json /dist/sample-prj

RUN npm install

COPY . /dist/sample-prj

EXPOSE 4200

CMD ["npm", "start"]
