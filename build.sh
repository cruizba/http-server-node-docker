#!/bin/bash
set -eu -o pipefail

export DOCKERHUB_USERNAME="${DOCKERHUB_USERNAME}"
export DOCKERHUB_PASSWORD="${DOCKERHUB_PASSWORD}"

function getLatestVersion() {
    local package_name=${1}
    npm view "${package_name}" version 
}

VERSION=$(getLatestVersion "http-server")
echo "$VERSION"

docker build --build-arg VERSION="${VERSION}" -t cruizba/http-server:"${VERSION}" .
docker tag cruizba/http-server:"${VERSION}" cruizba/http-server:latest

echo "${DOCKERHUB_PASSWORD}" | docker login --username cruizba --password-stdin
docker push cruizba/http-server:"${VERSION}"
docker push cruizba/http-server:latest
docker logout