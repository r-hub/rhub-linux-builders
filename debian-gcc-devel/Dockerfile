## Emacs, make this -*- mode: sh; -*-

FROM rhub/debian-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org

RUN cd /tmp \
    && svn co http://svn.r-project.org/R/trunk R-devel

ENV RPREFIX /opt/R-devel

ENV ROPTIONS --with-recommended-packages=no

ENV CC gcc-5
ENV CXX g++-5
ENV F77 gfortran-5
ENV CPP cpp-5

RUN cd /tmp/R-devel \
    && R_PAPERSIZE=letter                                    \
    R_BATCHSAVE="--no-save --no-restore"                     \
    PERL=/usr/bin/perl                                       \
    R_UNZIPCMD=/usr/bin/unzip                                \
    R_ZIPCMD=/usr/bin/zip                                    \
    R_PRINTCMD=/usr/bin/lpr                                  \
    AWK=/usr/bin/awk                                         \
    CC="gcc-5"                                               \
    CXX="g++-5"                                              \
    F77="gfortran-5"                                         \
    CPP="cpp-5"                                              \
    CFLAGS="-std=gnu99 -Wall -pedantic"                      \
    CXXFLAGS="-Wall -pedantic"                               \
    LIBS="-lz -lbz2 -llzma"                                  \
    ./configure --prefix=${RPREFIX} ${ROPTIONS}              \
    && make                                                  \
    && make install

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
