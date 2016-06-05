FROM alpine:3.3

EXPOSE 80

RUN apk add --update nginx-lua rsync && \
    mkdir -p /tmp/nginx/client-body && \
    rm -rf /var/cache/apk/*

COPY . /

VOLUME ["/data"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;", "-p", "/app", "-c", "/nginx.conf"]
