#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker build . -t d3v01d/flox:latest
docker push d3v01d/flox:latest
