FROM java:alpine

EXPOSE 8080

COPY . /usr/local/bin

RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["docker-entrypoint.sh"]
