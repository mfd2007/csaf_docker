FROM linuxserver/nginx:latest

COPY --from=golang:1.19-alpine /usr/local/go/ /usr/local/go/
COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_provider /usr/lib/cgi-bin/csaf_provider.go
COPY --from=csaf_base:latest /version /version
 
ENV PATH="/usr/local/go/bin:${PATH}"

RUN apk add --no-cache spawn-fcgi fcgiwrap
COPY root/ /

EXPOSE 80 443
