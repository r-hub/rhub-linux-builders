#! /bin/sh

docker login -u $DOCKER_USER -p $DOCKER_PASS   || exit 1

# Do not want to exit on error now
set +e

# Clean up unused Docker images and containers
docker images  | grep -v latest | awk ' { print $3; } ' | xargs docker rmi || true
docker ps -a | grep 'Exited' |  awk ' { print $1; } ' | xargs docker rm || true

# We don't build the relase versions periodically, these are
# done manually, as needed.

failed=0
./build-image.sh debian                        || failed=1
./build-image.sh debian-gcc                    || failed=1
./build-image.sh debian-gcc-devel   --no-cache || failed=1
./build-image.sh debian-gcc-devel-nold --no-cache || failed=1
./build-image.sh debian-gcc-release            || failed=1
./build-image.sh debian-gcc-patched --no-cache || failed=1
./build-image.sh debian-clang                  || failed=1
./build-image.sh debian-clang-devel            || failed=1

./build-image.sh fedora                        || failed=1
./build-image.sh fedora-clang                  || failed=1
./build-image.sh fedora-clang-devel --no-cache || failed=1
./build-image.sh fedora-gcc                    || failed=1
./build-image.sh fedora-gcc-devel   --no-cache || failed=1

./build-image.sh centos6-epel                  || failed=1
./build-image.sh centos6-epel-rdt              || failed=1

./build-image.sh ubuntu                        || failed=1
./build-image.sh ubuntu-gcc                    || failed=1
./build-image.sh ubuntu-gcc-devel   --no-cache || failed=1
./build-image.sh ubuntu-gcc-release            || failed=1

./build-image.sh rocker-gcc-san     --no-cache || failed=1
./build-image.sh ubuntu-rchk        --no-cache || failed=1

exit $failed
