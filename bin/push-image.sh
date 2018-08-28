#!/usr/bin/env bash
set -eu

name=$1

# Usage: retry MAX CMD...
# Retry CMD up to MAX times. If it fails MAX times, returns failure.
# Example: retry 3 docker push "mozilla/normandy:$TAG"
function retry() {
    max=$1
    shift
    count=1
    until "$@"; do
        count=$((count + 1))
        if [[ $count -gt $max ]]; then
            return 1
        fi
        echo "$count / $max"
    done
    return 0
}

echo "${DOCKER_PASS}" | docker login --username="${DOCKER_USER}" --password-stdin

source_image="${name}"
version="$(date -Idate)" # Format like "2018-08-27"
versioned_image="${DOCKERHUB_REPO}:${name}-${version}"
latest_image="${DOCKERHUB_REPO}:${name}-latest"

docker tag "${source_image}" "${versioned_image}" || (echo "Couldn't re-tag ${image} as ${latest_image}" && false)
retry 3 docker push "${versioned_image}" || (echo "Couldn't push ${versioned_image}" && false)
echo "Pushed ${versioned_image}"

docker tag "${source_image}" "${latest_image}" || (echo "Couldn't re-tag ${image} as ${latest_image}" && false)
retry 3 docker push "${latest_image}" || (echo "Couldn't push ${latest_image}" && false)
echo "Pushed ${latest_image}"
