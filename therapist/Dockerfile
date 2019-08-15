# Latest stable Python 3
FROM python:3-stretch@sha256:8d60d4ca1ab2eff915551164c3dfdb14f0983480cec80bbe8cb802d0dfa889ed

LABEL maintainer="Rehan Dalal <rdalal@mozilla.com>"

RUN apt-get update
RUN apt-get install -y apt-transport-https git

# Install node prereqs, nodejs and yarn
# Ref: https://deb.nodesource.com/setup_10.x
# Ref: https://yarnpkg.com/en/docs/install
RUN echo "deb https://deb.nodesource.com/node_10.x stretch main" > /etc/apt/sources.list.d/nodesource.list && \
    wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -yqq nodejs yarn && \
    npm i -g npm@>=6 && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install therapist
RUN pip install -U pip therapist
