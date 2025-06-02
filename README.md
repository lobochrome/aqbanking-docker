# aqbanking-docker
[![Build Status](https://github.com/lobochrome/aqbanking-docker/actions/workflows/docker-build.yml/badge.svg)](https://github.com/lobochrome/aqbanking-docker/actions/workflows/docker-build.yml)

A Docker image for building and running AqBanking. The image uses a multi-stage
build on top of `debian:stable-slim` to keep the final size small.

## Building locally

```bash
docker build -t aqbanking .
```

## Continuous integration

The repository contains a GitHub Actions workflow that builds the Docker image on
every push to verify that the Dockerfile remains valid.
