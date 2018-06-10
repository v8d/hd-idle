FROM alpine:latest

LABEL maintainer="https://v8d.xyz"

ENV IDLE_SECS="14400"

RUN \
    wget https://sourceforge.net/projects/hd-idle/files/hd-idle-1.05.tgz && \
    tar -xzvf hd-idle-1.05.tgz && \
    apk add --update-cache alpine-sdk && \
    make -C /hd-idle/ && \
    mv -v /hd-idle/hd-idle /usr/sbin/ && \
    rm -rf /hd-idle && \
    apk del --purge alpine-sdk && \
    rm -rf /var/cache/apk/*

CMD /usr/sbin/hd-idle -d -i $IDLE_SECS
