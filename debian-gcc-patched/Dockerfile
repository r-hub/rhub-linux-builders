## Emacs, make this -*- mode: sh; -*-

FROM rhub/debian-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org
ENV RVERSION patched

RUN curl -O https://stat.ethz.ch/R/daily/R-patched.tar.bz2 \
    && tar xjf R-patched.tar.bz2

ENV RPREFIX /opt/R-patched

ENV ROPTIONS --with-recommended-packages --enable-R-shlib --enable-R-static-lib

RUN apt-get update \
    && apt-get -y install rsync

RUN cd R-patched || cd R-rc                                      \
        && ./tools/rsync-recommended                             \
        && R_PAPERSIZE=letter                                    \
        R_BATCHSAVE="--no-save --no-restore"                     \
        PERL=/usr/bin/perl                                       \
        R_UNZIPCMD=/usr/bin/unzip                                \
        R_ZIPCMD=/usr/bin/zip                                    \
        R_PRINTCMD=/usr/bin/lpr                                  \
        AWK=/usr/bin/awk                                         \
        CFLAGS="-std=gnu99 -Wall -pedantic"                      \
        CXXFLAGS="-Wall -pedantic"                               \
        LIBS="-lz -lbz2 -llzma"                                  \
        ./configure --prefix=${RPREFIX} ${ROPTIONS}              \
        && make                                                  \
        && make install

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
