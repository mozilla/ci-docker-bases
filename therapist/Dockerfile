FROM python:3.9@sha256:879ca68cf1d4a3404534d2af625558d9c3aef8c3012e1e5d56f7036d13f56006

LABEL maintainer="Rehan Dalal <rdalal@mozilla.com>"

RUN apt-get update
RUN apt-get --no-install-recommends install -y apt-transport-https git apt-utils ca-certificates

# Install node prereqs, nodejs and yarn
# Ref: https://deb.nodesource.com/setup_14.x
# Ref: https://yarnpkg.com/en/docs/install
RUN echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
    wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    apt-get update && \
    apt-get --no-install-recommends install -yqq nodejs yarn && \
    npm i -g npm@>=6 && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install needed tools
RUN pip install -U pip therapist poetry
