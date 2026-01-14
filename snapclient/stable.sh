#!/bin/bash

set -Eeuo pipefail

trap fail ERR

fail() {
    echo "Failed"
}

SHA256_AMD64="e3ef6a2c179e5c5743ee25e06345b2d602e51779c3d0c97b718b4eb625049f07"
SHA256_ARM64="07cc9391a3dde10e243950958f276814be19c57efcd15b562424c9e3ada32a5b"

cd src
docker buildx use multiarch

echo "Building amd64"
docker buildx build --platform linux/amd64 . \
    -t d3v01d/snapclient:stable-amd64 \
    --build-arg="ARCH=amd64" \
    --build-arg="SHA256=${SHA256_AMD64}" \
    --push --progress=plain

echo "Building aarch64"
docker buildx build --platform linux/aarch64 . \
    -t d3v01d/snapclient:stable-aarch64 \
    --build-arg="ARCH=arm64" \
    --build-arg="SHA256=${SHA256_ARM64}" \
    --push --progress=plain