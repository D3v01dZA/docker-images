#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

#docker buildx create --name multiarch
docker buildx use multiarch
docker buildx build ./vouch-proxy/ --platform linux/arm/v7 --platform linux/aarch64 --platform linux/amd64 --tag d3v01d/vouch-proxy:stable --push
