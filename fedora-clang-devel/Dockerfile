## Emacs, make this -*- mode: sh; -*-

FROM rhub/fedora-clang

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org

RUN cd /tmp \
    && svn co https://svn.r-project.org/R/trunk R-devel

ENV RPREFIX /opt/R-devel

ENV ROPTIONS --with-x --with-recommended-packages --enable-R-shlib --enable-R-static-lib

ENV CC /usr/bin/clang
ENV CXX /usr/bin/clang++
ENV F77 gfortran
ENV CPP cpp

RUN yum -y install rsync

RUN cd /tmp/R-devel \
    && ./tools/rsync-recommended \
    && R_PAPERSIZE=letter                                    \
    R_BATCHSAVE="--no-save --no-restore"                     \
    ./configure --prefix=${RPREFIX} ${ROPTIONS}              \
    && make                                                  \
    && make install

COPY xvfb-run /usr/local/bin/xvfb-run

RUN chmod +x /usr/local/bin/xvfb-run && \
    rm -f /bin/xvfb-run /usr/bin/xvfb-run

ENV RHUB_PLATFORM linux-x86_64-fedora-clang
