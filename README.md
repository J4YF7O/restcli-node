# restcli-node
[![Build Status](https://travis-ci.org/J4YF7O/restcli-node.svg?branch=main)](https://travis-ci.org/J4YF7O/restcli-node)

Node docker image with [rest-cli](https://github.com/restcli/restcli) command installed.

[<img src="https://www.docker.com/sites/default/files/d8/2019-07/horizontal-logo-monochromatic-white.png" alt="drawing" width="150"/>](https://hub.docker.com/repository/docker/j4yf7o/restcli-node)

## Usage

### Docker run
````shell
docker run -v "$(pwd)"/test:/test j4yf7o/restcli-node rest-cli ls -D test/*.http
````

### Gitlab Ci
```yaml
test-api:
  image: j4yf7o/restcli-node
  before_script:
    - yarn
    - yarn add wait-port
    - yarn start:dev &
  script:
    - yarn wait-port 3000
    - rest-cli ls -D test/*.http
  after_script:
    - pkill node
```

## Credit

- The fabulous repository [rest-cli](https://github.com/restcli/restcli) for intellij http-request.
