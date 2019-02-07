FROM ubuntu:18.04@sha256:7a47ccc3bbe8a451b500d2b53104868b46d60ee8f5b35a24b41a86077c650210

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

RUN apt-get update
RUN apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg \
        make \
        openssh-client \
        software-properties-common

# Install Firefox dependencies (but not Firefox)
RUN apt-get install -y $(apt-cache depends firefox | awk '/Depends/ {print $2}')

# Install node
RUN apt-get install -y nodejs npm
RUN apt-get install apt-transport-https

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn
ENV PATH="$PATH:$HOME/.yarn/bin"

# Install Firefox
RUN yarn global add get-firefox
RUN cd /opt && get-firefox --check --extract --verbose --branch release && ln -s /opt/firefox/firefox /usr/bin/firefox

# Cleanup
RUN apt-get clean