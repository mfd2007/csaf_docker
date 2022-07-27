# Image to run
FROM golang:1.18.4-alpine3.16

COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_aggregator /usr/local/csaf_aggregator
COPY --from=csaf_base:latest /version /version

COPY root/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN addgroup -S user -g 1000 && adduser -S user -G user -u 1000
USER user

ENTRYPOINT ["/docker-entrypoint.sh"]