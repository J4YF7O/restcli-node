FROM alpine as BUILD

RUN mkdir -p /tmp/restcli
WORKDIR /tmp/restcli

RUN apk add unzip
RUN apk add curl
RUN apk add grep
RUN apk add sed

COPY src/download-last-jar.sh download-last-jar.sh
RUN chmod +x download-last-jar.sh
RUN ./download-last-jar.sh

FROM node:latest
RUN mkdir /restcli
COPY --from=BUILD /tmp/restcli/restcli.jar /restcli/restcli.jar

RUN apt-get update
RUN apt-get -y install default-jre
COPY src/rest-cli.sh /usr/local/bin/rest-cli
RUN chmod +x /usr/local/bin/rest-cli
