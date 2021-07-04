FROM debian:latest

ADD docker-entrypoint.sh /

RUN apt-get update \
    && apt-get install cron -y --no-install-suggests --no-install-recommends \
    && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sleep", "600"]
