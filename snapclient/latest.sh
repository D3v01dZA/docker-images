#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker buildx use multiarch
docker buildx build --platform linux/amd64 . -t d3v01d/snapclient:latest-amd64 --build-arg="ARCH=amd64" --push --progress=plain
docker buildx build --platform linux/armhf . -t d3v01d/snapclient:latest-armhf --build-arg="ARCH=armhf" --push --progress=plain
docker buildx build --platform linux/aarch64 . -t d3v01d/snapclient:latest-aarch64 --build-arg="ARCH=arm64" --push --progress=plain