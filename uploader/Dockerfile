# Image to run
FROM golang:1.18.4-alpine3.16

COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_uploader /usr/local/csaf_uploader
COPY --from=csaf_base:latest /version /version
COPY ./root/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN addgroup -S user && adduser -S user -G user
USER user

#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c", "/usr/local/csaf_uploader $OPTIONS"]