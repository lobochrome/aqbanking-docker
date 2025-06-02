# aqbanking-docker

[![Docker build](https://github.com/yourusername/aqbanking-docker/actions/workflows/docker-build.yml/badge.svg)](https://github.com/yourusername/aqbanking-docker/actions/workflows/docker-build.yml)

A Docker image for building and running AqBanking. The image uses a multi-stage
build on top of `debian:stable-slim` to keep the final size small. The build
clones `gwenhywfar` from the GitHub mirror and uses a `.dockerignore` to avoid
sending Git metadata to Docker.

## Building locally

```bash
docker build -t aqbanking .
```

## Continuous integration

The repository contains a GitHub Actions workflow that builds the Docker image on
every push to verify that the Dockerfile remains valid.
