FROM node:18

WORKDIR /app

COPY ./app/package.json ./app/yarn.lock ./

RUN yarn install

COPY ./app .

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]