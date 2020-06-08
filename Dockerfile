FROM alpine:3.6

RUN apk -v --update --no-cache add \
        curl \
        openssl \
        python \
        py-pip \
        wget \
        && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && \
    # rm /var/cache/apk/* && \
    wget -q -O gomplate https://github.com/hairyhenderson/gomplate/releases/download/v2.4.0/gomplate_linux-amd64-slim && \
    wget -q -O kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl gomplate && \
    mv kubectl gomplate /usr/local/bin

ENTRYPOINT ["/bin/sh","-c"]
CMD [""]
WORKDIR /tmp
