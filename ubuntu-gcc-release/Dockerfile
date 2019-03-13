## Emacs, make this -*- mode: sh; -*-

FROM rhub/ubuntu-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN https://cloud.r-project.org

## This is for simplicity as the builder backend adds it to the PATH
RUN mkdir -p /opt/R

RUN apt-get update && apt-get -y install apt-transport-https

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> \
       /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com  \
      --recv-keys E084DAB9  &&                    \
    apt-get update &&                             \
    apt-get -y install r-base r-base-dev

RUN echo "deb https://files.r-hub.io/pandoc/ubuntu-16.04/ amd64/" > \
       /etc/apt/sources.list.d/rhub-pandoc-ubuntu-16.04.list &&     \
    apt-get update && \
    apt-get -y --allow-unauthenticated install pandoc pandoc-citeproc

RUN apt-get -y upgrade

RUN apt-get clean

ENV RHUB_PLATFORM linux-x86_64-ubuntu-gcc
ENV RHUB_BINARIES yes
