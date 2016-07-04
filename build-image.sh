#! /bin/sh

# Exit immediately on error & be verbose
set -ex

REPO="$1"
cd "$REPO"
docker build -t rhub/"$REPO" .
docker push rhub/"$REPO"
