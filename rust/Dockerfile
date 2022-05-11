# latest stable Rust 1.x
FROM rust:buster@sha256:ca2c348b8b7cc97a7b2e399969b77e6743ff2338d9141a759c1306e4627db6bb

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# cargo-kcov needs kcov >= 30, which is not in the Debian Buster repositories,
# so build it directly using a script provided by cargo-kcov.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils ca-certificates cmake g++ pkg-config jq libcurl4-openssl-dev libelf-dev libdw-dev binutils-dev libiberty-dev
RUN cargo install cargo-kcov
RUN mkdir -p /tmp/kcov && \
    cd /tmp/kcov && \
    cargo kcov --print-install-kcov-sh | sh

RUN rustup component add rustfmt
RUN rustup component add clippy
RUN cargo install cargo-audit
RUN cargo install sccache
RUN cargo install cargo-hack
RUN cargo install mdbook

# Cleanup
RUN apt-get clean && \
    rm -rf /tmp/kcov
