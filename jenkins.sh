#! /bin/sh

export DOCKER_USER=gaborcsardi
docker login -u $DOCKER_USER -p $DOCKER_PASS   || exit 1

# Do not want to exit on error now
set +e

# We don't build the relase versions periodically, these are
# done manually, as needed.

failed=0
./build-image.sh debian             --no-cache || failed=1
./build-image.sh debian-gcc         --no-cache || failed=1
./build-image.sh debian-gcc-devel   --no-cache || failed=1
./build-image.sh debian-gcc-devel-nold --no-cache || failed=1
./build-image.sh debian-gcc-release            || failed=1
./build-image.sh debian-gcc-patched --no-cache || failed=1
./build-image.sh debian-clang       --no-cache || failed=1
./build-image.sh debian-clang-devel --no-cache || failed=1

./build-image.sh fedora             --no-cache || failed=1
./build-image.sh fedora-clang       --no-cache || failed=1
./build-image.sh fedora-clang-devel --no-cache || failed=1
./build-image.sh fedora-gcc         --no-cache || failed=1
./build-image.sh fedora-gcc-devel   --no-cache || failed=1

./build-image.sh centos-epel                   || failed=1

./build-image.sh ubuntu             --no-cache || failed=1
./build-image.sh ubuntu-gcc         --no-cache || failed=1
./build-image.sh ubuntu-gcc-devel   --no-cache || failed=1
./build-image.sh ubuntu-gcc-release            || failed=1

./build-image.sh rocker-gcc-san     --no-cache || failed=1
./build-image.sh ubuntu-rchk        --no-cache || failed=1

exit $failed
