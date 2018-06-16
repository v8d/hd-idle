FROM alpine:latest

LABEL maintainer="https://v8d.xyz"

RUN apk add --update-cache alpine-sdk ca-certificates

RUN \
    wget https://sourceforge.net/projects/hd-idle/files/hd-idle-1.05.tgz && \
    tar -xzvf hd-idle-1.05.tgz

RUN \
    make -C /hd-idle/ && \
    mv -v /hd-idle/hd-idle /usr/sbin/ && \
    rm -rf /hd-idle

RUN \
    apk del --purge alpine-sdk && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/hd-idle"]
