## Emacs, make this -*- mode: sh; -*-

FROM ubuntu:20.04

MAINTAINER "r-hub admin" admin@r-hub.io

## Install rig

RUN curl -Ls https://github.com/r-lib/rig/releases/download/latest/rig-linux-latest.tar.gz |
  sudo tar xz -C /usr/local

## Install R
## This sets up RSPM as well

RUN rig add release && apt-get clean

ENV RHUB_PLATFORM linux-x86_64-ubuntu-gcc
