# latest stable Rust 1.x
FROM rust:1-stretch@sha256:b3a396a030942e5aa8718a1082ff0566860b5f9c8dc2265ce827fff2d4df8372

LABEL maintainer="Michael Cooper <mcooper@mozilla.com>"

# cargo-kcov needs kcov >= 30. Debian Stretch has kcov 11, so these steps build
# kcov directly.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils ca-certificates cmake g++ pkg-config jq libcurl4-openssl-dev libelf-dev libdw-dev binutils-dev libiberty-dev
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
