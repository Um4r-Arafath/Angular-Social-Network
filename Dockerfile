FROM node:22-alpine3.19 AS build

WORKDIR /angular-app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.27.0-alpine

COPY --from=build /angular-app/dist/angular-social-network /usr/share/nginx/html
