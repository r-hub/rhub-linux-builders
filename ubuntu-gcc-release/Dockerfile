## Emacs, make this -*- mode: sh; -*-

FROM rhub/ubuntu-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org
ENV RVERSION 3.4.2

RUN rm -rf R-${RVERSION} R-${RVERSION}.tar.gz \
        && major=$(echo $RVERSION | sed 's/\..*$//') \
        && url="${CRAN}/src/base/R-${major}/R-${RVERSION}.tar.gz" \
        && curl -O "$url" \
        && tar xzf "R-${RVERSION}.tar.gz"

ENV RPREFIX /opt/R-${RVERSION}

ENV ROPTIONS --with-recommended-packages=no --enable-R-shlib --enable-R-static-lib

RUN cd R-${RVERSION}                                             \
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

RUN apt-get update && apt-get -y install apt-transport-https

RUN echo "deb https://files.r-hub.io/pandoc/ubuntu-16.04/ amd64/" > \
       /etc/apt/sources.list.d/rhub-pandoc-ubuntu-16.04.list &&     \
    apt-get update && \
    apt-get -y --allow-unauthenticated install pandoc pandoc-citeproc

ENV RHUB_PLATFORM linux-x86_64-ubuntu-gcc
ENV RHUB_BINARIES yes
