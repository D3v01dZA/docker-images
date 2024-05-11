#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

#docker buildx create --name multiarch
docker buildx use multiarch
docker buildx build --platform linux/arm/v7 --platform linux/aarch64 . -t d3v01d/nut-upsd:latest --push
