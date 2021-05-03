FROM node:lts-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY .babelrc .
COPY .eslintrc.js .
COPY gatsby-config.js .
COPY gatsby-node.js .
COPY jekyll/src/_posts ./jekyll/src/_posts
COPY src ./src

RUN npm run build

FROM nginx:alpine

COPY --from=0 /app/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
