#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker tag d3v01d/snapserver:latest d3v01d/snapserver:stable
docker push d3v01d/snapserver:stable
