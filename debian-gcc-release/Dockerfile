## Emacs, make this -*- mode: sh; -*-

FROM rhub/debian-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN https://cran.r-project.org

## This is for simplicity as the builder backend adds it to the PATH
RUN mkdir -p /opt/R

RUN apt-get update &&                     \
    apt-get -y install r-base r-base-dev

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
