FROM ubuntu:18.04@sha256:c32bd2e76e7688eeb1bb39754fff7cdfc571626fc1abfded4f82a90de79f8d10

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
