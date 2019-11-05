FROM node:10-alpine

RUN apk update && apk add bash
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.13.0

WORKDIR /app
ENV PATH /app/node_modules/.bin:/root/.yarn/bin:$PATH

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . /app

EXPOSE 3000
CMD ["node", "index.js"]
