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
