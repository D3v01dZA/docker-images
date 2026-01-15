#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

docker buildx build --platform linux/amd64 . \
    -t d3v01d/prism:stable \
    --push --progress=plain