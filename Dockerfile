# FROM node:10-alpine
# FROM buildkite/agent:3

# RUN apk update && apk add bash
# RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.13.0

# WORKDIR /app
# ENV PATH /app/node_modules/.bin:/root/.yarn/bin:$PATH

# COPY package.json .
# COPY yarn.lock .
# RUN yarn install

# COPY . /app

# EXPOSE 3000
# CMD ["node", "index.js"]
FROM buildkite/agent:3
VOLUME /hooks
