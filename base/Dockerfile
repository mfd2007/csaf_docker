FROM golang:1.18.4-alpine3.16

RUN apk add bash make wget git
RUN mkdir /app
COPY compile.sh /app/compile.sh
WORKDIR /app
RUN bash /app/compile.sh