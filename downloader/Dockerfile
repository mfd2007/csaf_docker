# Image to run
FROM golang:1.18.4-alpine3.16

COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_downloader /usr/local/csaf_downloader
COPY --from=csaf_base:latest /version /version

RUN addgroup -S user && adduser -S user -G user
USER user

#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c", "/usr/local/csaf_downloader $OPTIONS"]