#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker buildx use multiarch
docker buildx build --platform linux/amd64 . -t d3v01d/snapserver:latest --push
