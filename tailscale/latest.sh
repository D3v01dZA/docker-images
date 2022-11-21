#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
#docker buildx create --name multiarch
docker buildx use multiarch
docker buildx build . --no-cache --platform linux/arm/v7,linux/amd64 --tag d3v01d/tailscale:latest --push
