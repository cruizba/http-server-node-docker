#!/bin/bash
set -eu -o pipefail

export DOCKERHUB_USERNAME="${DOCKERHUB_USERNAME}"
export DOCKERHUB_PASSWORD="${DOCKERHUB_PASSWORD}"

function docker_tag_exists() {
    TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${DOCKERHUB_USERNAME}'", "password": "'${DOCKERHUB_PASSWORD}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
    curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2/ > /dev/null
}

function getLatestVersion() {
    local package_name=${1}
    npm view "${package_name}" version 
}

VERSION=$(getLatestVersion "http-server")
echo "$VERSION"



if docker_tag_exists cruizba/http-server "${VERSION}"; then
    echo "The version exists. No new docker image will be created"
    exit 0
fi

docker build --build-arg VERSION="${VERSION}" -t cruizba/http-server:"${VERSION}" .
docker tag cruizba/http-server:"${VERSION}" cruizba/http-server:latest

echo "${DOCKERHUB_PASSWORD}" | docker login --username cruizba --password-stdin
docker push cruizba/http-server:"${VERSION}"
docker push cruizba/http-server:latest
docker logout