# Image to run
FROM golang:alpine

COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_uploader /usr/local/csaf_uploader
COPY --from=csaf_base:latest /version /version
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN addgroup -S user -g 1000 && adduser -S user -G user -u 1000
USER user

ENTRYPOINT ["/docker-entrypoint.sh"]
