#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

#docker buildx create --name multiarch
docker buildx use multiarch
docker buildx build . --platform linux/amd64 --tag d3v01d/mopidy:stable --push
