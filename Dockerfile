FROM alpine:3.4

ENTRYPOINT ["bin/slack-notifier"]

# enable to access slack api by https
RUN apk --no-cache add ca-certificates openssl
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
    && apk add glibc-2.23-r3.apk \
    && rm glibc-2.23-r3.apk

COPY bin/slack-notifier /bin/slack-notifier
