# Solo se define posteriormente
ARG NODE_IMAGE_TAG=23.7-alpine3.20 

FROM node:${NODE_IMAGE_TAG} AS development

WORKDIR /usr/src/app

COPY ../api/package*.json ./

RUN npm install glob rimraf

RUN npm install --only=development

COPY ../api/ .

FROM node:${NODE_IMAGE_TAG} AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY ../api/package*.json ./

RUN npm install --only=production

COPY ../api/ .

COPY --from=development /usr/src/app/dist ./dist

CMD ["node", "dist/main"]
