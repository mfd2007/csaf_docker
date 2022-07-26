FROM golang:1.18.4-alpine3.16

#Download and compile csaf-provider
COPY compile.sh /compile.sh
# Install dependencies
RUN apk add bash make wget git;chmod +x /compile.sh;sh /compile.sh;rm /compile.sh
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

#WORKDIR /root/csaf_distribution/cmd/csaf_checker/
ENTRYPOINT ["/docker-entrypoint.sh"]
