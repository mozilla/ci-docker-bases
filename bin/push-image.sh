#!/usr/bin/env bash
set -eu

image=$1

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

echo "$DOCKER_PASS" | docker login --username="$DOCKER_USER" --password-stdin

versioned="${image}:latest"
docker tag "${image}" "${versioned}" || (echo "Couldn't re-tag ${image} as ${versioned}" && false)
retry 3 docker push "${versioned}" || (echo "Couldn't push ${versioned}" && false)

echo "Pushed ${versioned}"
