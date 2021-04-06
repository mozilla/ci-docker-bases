# latest stable Rust 1.x
FROM rust:buster@sha256:e5609acbecc36614df98ede626b38d76ad5b8472249447c8d36faca1787d9733

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

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

# Cleanup
RUN apt-get clean && \
    rm -rf /tmp/kcov
