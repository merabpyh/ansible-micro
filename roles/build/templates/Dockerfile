FROM java:alpine

EXPOSE 8080

COPY ./build/libs/webprog-{{ version.stdout }}.jar /tmp

COPY ./docker-entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["docker-entrypoint.sh"]
