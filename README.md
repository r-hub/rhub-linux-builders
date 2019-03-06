# rhub-linux-builders

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

Docker configuration for the Linux builders of the [R-hub package builder](https://builder.r-hub.io/advanced).

Most subfolders correspond to a platform configuration, e.g. [debian-gcc-release](https://github.com/r-hub/rhub-linux-builders/tree/master/debian-gcc-release) contains the Dockerfile corresponding to the "Debian Linux, R-release, GCC" platform, whereas [debian-gcc](https://github.com/r-hub/rhub-linux-builders/tree/master/debian-gcc) contains the Dockerfile that's used as base for all Debian GCC platforms, whose Dockerfiles start with `FROM rhub/debian-gcc`.

If you're interested in _running_ one of the images, you can get it from [Docker hub](https://hub.docker.com/u/rhub) instead of building it yourself. E.g. you could run something like `docker run -ti  rhub/fedora-clang-devel bash`.

image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[debian-gcc-devel](https://hub.docker.com/r/rhub/debian-gcc-devel)            |  Debian Linux, R-devel, GCC   | [![](https://images.microbadger.com/badges/image/rhub/debian-gcc-devel.svg)](https://microbadger.com/images/rhub/debian-gcc-devel) | [![](https://img.shields.io/docker/pulls/rhub/debian-gcc-devel.svg)](https://hub.docker.com/r/rhub/debian-gcc-devel) |  [![](https://img.shields.io/docker/automated/rhub/debian-gcc-devel.svg)](https://hub.docker.com/r/rhub/debian-gcc-devel/builds)
