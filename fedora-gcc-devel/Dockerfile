## Emacs, make this -*- mode: sh; -*-

FROM rhub/fedora-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org

RUN cd /tmp \
    && svn co http://svn.r-project.org/R/trunk R-devel

ENV RPREFIX /opt/R-devel

ENV ROPTIONS --with-recommended-packages=no

RUN cd /tmp/R-devel \
    && R_PAPERSIZE=letter                                    \
    R_BATCHSAVE="--no-save --no-restore"                     \
    ./configure --prefix=${RPREFIX} ${ROPTIONS}              \
    && make                                                  \
    && make install

ENV RHUB_PLATFORM linux-x86_64-debian-gcc
