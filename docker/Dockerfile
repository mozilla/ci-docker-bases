FROM ubuntu:18.04@sha256:85c0fa27a9e174e31b54b61858a95ca5c36a73c0e9d85a9484b6bd282219b083

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

RUN apt-get update \
    && apt-get --no-install-recommends install -y \
        apt-transport-https \
        apt-utils \
        bash \
        ca-certificates \
        curl \
        git \
        gnupg \
        make \
        openssh-client \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get --no-install-recommends install -y docker-ce=18.03.1~ce~3-0~ubuntu \
    && curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && apt-get clean
