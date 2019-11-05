# buildkite-demo
[![Build Status](https://badge.buildkite.com/734a6b47871896dd1ccc2c03d1e387827e8129fde914263582.svg)](https://buildkite.com/green-flowers/my-first-pipeline)

## test
1. push to trigger
have some  permission issues -> delete secrect
2. push to trigger
have some  permission issues -> change repository from ssh to https
3. push to trigger
ok -> test failed
add docker plugin in steps
4. push to trigger
fail -> delete docker plugin in steps
5. push to trigger
fail -> add docker plugin, set firts step to this
 - command: "./auto/run-unit-tests"
    label: "Run unit tests"
    plugins:
      - docker#v3.3.0:
          image: "node:8.11.3-alpine"
          environment:
            - "NODE_ENV=test"
          volumes: $(pwd):/app
6. push to trigger
fail -> set volumns to 
 volumes:
  - "$(pwd):/app"
7. trigger to push
fail -> set first step to 
 - command: "cd /app && yarn install && yarn test --coverage"
    label: "Run unit tests"
     plugins:
      - docker#v3.3.0:
          image: "node:8.11.3-alpine"
8. trigger to push
fail -> 
```
 - command: "yarn install && yarn test --coverage"
    label: "Run unit tests"
     plugins:
      - docker#v3.3.0:
          image: "node:8.11.3-alpine"
```
9. trigger to push 
fail -> 
```
 - command:
    - "yarn install"
    - "yarn run test --coverage"
    label: "Run unit tests"
    plugins:
      - docker#v3.3.0:
          image: "node:8.11.3-alpine"
```
10. trigger
```
steps:
  - command:
    - "yarn install"
    - "yarn run test --coverage"
    label: "Run unit tests"
    plugins:
      - docker#v3.3.0:
          image: "node:7"
          always-pull: true
          volumes:
            - "/var/run/docker.sock:/var/run/docker.sock"
```
some success :smile:
but stil fail because: error Couldn't find a package.json file in "/workdir"
11. trigger
```
steps:
  - command:
    - "yarn install"
    - "yarn run test --coverage"
    label: "Run unit tests"
    plugins:
      - docker#v3.3.0:
          image: "node:7"
          always-pull: true
          volumes:
            - "/var/run/docker.sock:/var/run/docker.sock"
          workdir: "/app"
```
fail -> error Couldn't find a package.json file in "/workdir"
12. trigger
change dockerfile
```
COPY package.json /app/
COPY yarn.lock /app/
```
fail -> same erro
13. trigger
```
# COPY package.json /app
# COPY yarn.lock /app
COPY . /app
RUN yarn install
```
fail -> same erro
14. trigger
```
# COPY package.json /app
# COPY yarn.lock /app
COPY . /app/
RUN yarn install
```  
fail -> same error
15. trigger
```
steps:
  - command:
    - "yarn install"
    - "yarn run test --coverage"
    label: "Run unit tests"
    plugins:
      - docker#v3.3.0:
          image: "node:7"
          always-pull: true
          volumes:
            - "/var/run/docker.sock:/var/run/docker.sock"
            - "./:/app/"
          workdir: "/app"
```
fail -> Error response from daemon: Duplicate mount point: /app.
16. 
```
volumes:
  - "/var/run/docker.sock:/var/run/docker.sock"
  - "./:/workdir/"
      workdir: "/workdir"
```
fail -> same error
17. trigger
```
volumes:
  - "/var/run/docker.sock:/var/run/docker.sock"
  - "./:./"
  workdir: "/app"
```
18. trigger
volume host code
19. test
20. test
21. test



