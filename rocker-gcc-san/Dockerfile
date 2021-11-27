FROM rocker/r-devel-san:latest

## Fix a rocker bug (?)
RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update -m && apt-get install -y curl

RUN apt-get install -y --no-install-recommends valgrind

RUN apt-get install -y --no-install-recommends qpdf

RUN apt-get install -y llvm-14

RUN apt-get install -y pandoc

RUN apt-get install -y aspell aspell-en

## Need to patch the R Makeconf file, to run with -g

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
ENV RBINARY /usr/local/bin/RD

ADD san.sh /usr/local/bin/

ENV RHUB_CHECK_COMMAND san.sh
