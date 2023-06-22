FROM golang:1.20-alpine

ARG TAG

RUN apk add bash make wget git
RUN mkdir /app
COPY compile.sh /app/compile.sh
WORKDIR /app
RUN bash /app/compile.sh
