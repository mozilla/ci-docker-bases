# latest stable Rust 1.x
FROM rust:1-stretch@sha256:73a2d14eee43aebb30ca6354f0e37eb8737b5c4893e3a3fbf51db72432e0bed1

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

# cargo-kcov needs kcov >= 30. Debian Stretch has kcov 11, so these steps build
# kcov directly.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y cmake g++ pkg-config jq libcurl4-openssl-dev libelf-dev libdw-dev binutils-dev libiberty-dev
RUN cargo install cargo-kcov
RUN mkdir -p /tmp/kcov && \
    cd /tmp/kcov && \
    cargo kcov --print-install-kcov-sh | sh

RUN rustup component add rustfmt && \
    rustup component add clippy && \
    cargo install cargo-audit

# Cleanup
RUN apt-get clean && \
    rm -rf /tmp/kcov