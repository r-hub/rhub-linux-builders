#! /bin/sh

# Exit immediately on error & be verbose
set -ex

export DOCKER_USER=gaborcsardi
docker login -u $DOCKER_USER -p $DOCKER_PASS   || exit 1

REPO="$1"
shift
cd "$REPO"

docker build --pull -t rhub/"$REPO" "$@" .
docker push rhub/"$REPO"
