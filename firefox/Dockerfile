FROM ubuntu:18.10@sha256:20b5d52b03712e2ba8819eb53be07612c67bb87560f121cc195af27208da10e0

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