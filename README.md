# rhub-linux-builders

Docker configuration for the Linux builders of the R-hub package builder.

Most subfolders correspond to a platform configuration, e.g. [debian-gcc-release](https://github.com/r-hub/rhub-linux-builders/tree/master/debian-gcc-release) contains the Dockerfile corresponding to the "Debian Linux, R-release, GCC" platform, whereas [debian-gcc](https://github.com/r-hub/rhub-linux-builders/tree/master/debian-gcc) contains the Dockerfile that's used as base for all Debian GCC platforms, whose Dockerfiles start with `FROM rhub/debian-gcc`.

If you're interested in _running_ one of the images, you can get it from [Docker hub](https://hub.docker.com/u/rhub) instead of building it yourself. E.g. you could run something like `docker run -ti  rhub/fedora-clang-devel bash`.
