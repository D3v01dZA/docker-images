#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker tag d3v01d/sds011:latest d3v01d/sds011:stable
docker push d3v01d/sds011:stable
