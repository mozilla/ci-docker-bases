FROM ubuntu:18.04@sha256:45c6f8f1b2fe15adaa72305616d69a6cd641169bc8b16886756919e7c01fa48b

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
