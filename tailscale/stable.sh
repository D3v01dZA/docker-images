#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

cd src
docker tag d3v01d/tailscale:latest d3v01d/tailscale:stable
docker push d3v01d/tailscale:stable
