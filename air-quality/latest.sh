#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

docker buildx build --platform linux/arm/v7 . -t d3v01d/sds011:latest
docker push d3v01d/sds011:latest
