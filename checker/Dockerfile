# Image to run
FROM golang:alpine

COPY --from=csaf_base:latest /app/csaf_distribution/bin-linux-amd64/csaf_checker /usr/local/csaf_checker
COPY --from=csaf_base:latest /version /version

RUN addgroup -S user -g 1000 && adduser -S user -G user -u 1000
USER user

#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c", "/usr/local/csaf_checker $OPTIONS"]
