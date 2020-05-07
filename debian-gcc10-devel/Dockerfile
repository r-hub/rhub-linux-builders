## Emacs, make this -*- mode: sh; -*-

FROM rhub/debian

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org

## Configure default locale,
## see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
         gcc-10 \
         g++-10 \
         gfortran-10

RUN rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && svn co https://svn.r-project.org/R/trunk R-devel

ENV RPREFIX /opt/R-devel

ENV ROPTIONS --with-recommended-packages --enable-R-shlib --enable-R-static-lib

RUN apt-get update \
    && apt-get -y install rsync

RUN apt-get -y remove gcc-8 cpp-8 g++-8

RUN cd /tmp/R-devel \
    && ./tools/rsync-recommended \
    && R_PAPERSIZE=letter                                    \
    R_BATCHSAVE="--no-save --no-restore"                     \
    PERL=/usr/bin/perl                                       \
    R_UNZIPCMD=/usr/bin/unzip                                \
    R_ZIPCMD=/usr/bin/zip                                    \
    R_PRINTCMD=/usr/bin/lpr                                  \
    AWK=/usr/bin/awk                                         \
    CC="gcc-10"                                              \
    CPP="cpp-10"                                             \
    CXX="g++-10"                                             \
    FC="gfortran-10"                                         \    
    CFLAGS="-std=gnu99 -Wall -pedantic"                      \
    CXXFLAGS="-Wall -pedantic"                               \
    LIBS="-lz -lbz2 -llzma"                                  \
    ./configure --prefix=${RPREFIX} ${ROPTIONS}              \
    && make                                                  \
    && make install

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
