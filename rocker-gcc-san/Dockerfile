FROM rocker/r-devel-san:latest

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           curl

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
ENV RBINARY /usr/local/bin/RD

ADD san.sh /usr/local/bin/

ENV RHUB_CHECK_COMMAND san.sh
