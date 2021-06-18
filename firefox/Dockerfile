FROM ubuntu:20.04@sha256:aba80b77e27148d99c034a987e7da3a287ed455390352663418c0f2ed40417fe

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV PATH="$PATH:$HOME/.yarn/bin"

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        apt-transport-https \
        apt-utils \
        ca-certificates \
        curl \
        git \
        gnupg \
        make \
        openssh-client \
        software-properties-common \
        apt-transport-https \
    && \
    apt-get --no-install-recommends install -y $(apt-cache depends firefox | awk '/Depends/ {print $2}') && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_12.x focal main' > /etc/apt/sources.list.d/nodesource.list && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y nodejs yarn && \
    yarn global add get-firefox && \
    cd /opt && \
    get-firefox --check --extract --verbose --branch release && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    apt-get clean
