# aqbanking-docker

[![Build Status](https://github.com/aqbanking/aqbanking-docker/actions/workflows/docker-build.yml/badge.svg)](https://github.com/aqbanking/aqbanking-docker/actions/workflows/docker-build.yml)

A Docker image for building and running AqBanking. The image uses a multi-stage build on top of `debian:stable-slim` to keep the final size small. The gwenhywfar library is built from the [GitHub mirror](https://github.com/aqbanking/gwenhywfar) instead of the old tarball.

The repository includes a `.dockerignore` so Git metadata and CI files are not sent to the Docker build context.

## Building locally

```bash
docker build -t aqbanking .
```

## Continuous integration

The repository contains a GitHub Actions workflow that builds the Docker image on every push to verify that the Dockerfile remains valid.
