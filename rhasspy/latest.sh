#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker build . -t d3v01d/rhasspy:latest
docker push d3v01d/rhasspy:latest