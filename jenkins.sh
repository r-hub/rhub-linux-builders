#! /bin/sh

docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

./build-image.sh debian-gcc         || true
./build-image.sh debian-gcc-devel   || true
./build-image.sh fedora-clang       || true
./build-image.sh fedora-clang-devel || true
./build-image.sh fedora-gcc         || true
./build-image.sh fedora-gcc-devel   || true
