# latest stable Rust 1.x
FROM rust:1-stretch@sha256:e9bf5ebf2a7d267559f11811c667a4abb0b5c5d8efb085f56a53d9465470f19b

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