FROM ubuntu:18.04@sha256:538529c9d229fb55f50e6746b119e899775205d62c0fc1b7e679b30d02ecb6e8

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

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
    echo 'deb https://deb.nodesource.com/node_12.x bionic main' > /etc/apt/sources.list.d/nodesource.list && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y nodejs yarn && \
    yarn global add get-firefox && \
    cd /opt && \
    get-firefox --check --extract --verbose --branch release && \
    ln -s /opt/firefox/firefox /usr/bin/firefox && \
    apt-get clean
