# latest stable Rust 1.x
FROM rust:1-stretch@sha256:6d01cd147bdd9cd76b26a12a835766b2a66bf94a279634b00d263b10816cfc6f

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
    rustup component add clippy

# Cleanup
RUN apt-get clean && \
    rm -rf /tmp/kcov