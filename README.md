# CI Bases

This is a collection of Docker images designed to be useful as base images in
Circle CI tests for Mozilla projects. They are automatically kept up to date,
and endeavor to provide a useful set of tools to run tests on.

Unless otherwise noted, all images are based on Ubuntu 20.04.

## Status: Deprecated
We plan to stop updating these images on October 1, 2022, and archive this repository.
We recommend using one of the
[Pre-Built CircleCI Docker Images](https://circleci.com/docs/2.0/circleci-images/)
instead. See https://github.com/mozilla/ci-docker-bases/issues/322 for more information.

We intend to keep the automated updates running until October 1, 2022, but do not plan
to add new images or features, or update to later OS versions.

## Available images

All images are in the [mozilla/cidockerbases repository][dockerhub].
Different images are available as tags within that repository. Images are
versioned by date, for example: `image-2018-08-27`. Additionally, for each
image type there is a `image-latest` tag.

There is no bare `latest` tag, so referring to `mozilla/cidockerbases` without
a version tag won't work. An explicit tag must be specified, like
`docker-latest`.

[dockerhub]: https://hub.docker.com/r/mozilla/cidockerbases/

### Docker

`mozilla/cidockerbases:docker-latest`

A modern version of Docker, Docker Compose, and other tools to make running
CI easier. A version of this image is used to build all the images in this
repository, including itself.


### Therapist

`mozilla/cidockerbases:therapist-latest`

The latest Python 3 and Node.js 10 with 
[Therapist](https://github.com/rehandalal/therapist) pre-installed.
A great base for linting jobs.

This is based on the ``python:3.9`` image, which is built on Debian 11 (bullseye).

### Rust

`mozilla/cidockerbases:rust-latest`

The latest stable version of Rust. Includes:

- rustfmt
- cargo-audit
- cargo-kcov for code coverage
- sccache for faster builds (requires set up)
- cargo-hack

This is based on the ``rust:buster`` image, which is built on Debian 10 (buster).

## Deprecated Images

These images are no longer built or published to Dockerhub

### Firefox

* `mozilla/cidockerbases:firefox-latest`
* `mozilla/cidockerbases:firefox-2022-09-02` (*final image*)

The latest stable version of Firefox and Node.js. A great base for running JS
integration tests in a browser.
