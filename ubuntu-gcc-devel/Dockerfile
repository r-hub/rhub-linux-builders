## Emacs, make this -*- mode: sh; -*-

FROM rhub/ubuntu-gcc

MAINTAINER "r-hub admin" admin@r-hub.io

ENV CRAN http://cran.r-project.org

RUN cd /tmp \
    && svn co https://svn.r-project.org/R/trunk R-devel

ENV RPREFIX /opt/R-devel

ENV ROPTIONS --with-recommended-packages=no --enable-R-shlib --enable-R-static-lib

#RUN add-apt-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"

#RUN curl -o - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update

RUN apt-get install -y clang-5.0 lldb-5.0 lld-5.0

RUN /usr/bin/clang-5.0 --version

RUN /usr/bin/clang++-5.0 --version

ENV CC /usr/bin/clang-5.0
ENV OBJC /usr/bin/clang++-5.0
ENV CXX /usr/bin/clang++-5.0
ENV F77 gfortran
ENV CPP cpp

RUN cd /tmp/R-devel \
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
    && MAKEFLAGS=-j8 nice make                               \
    && make install

RUN apt-get update && apt-get -y install apt-transport-https

ENV RHUB_PLATFORM linux-x86_64-ubuntu-clang-5.0

RUN false

RUN \
    CFLAGS="-g -O3 -Wall -pedantic -mtune=native"            \
    FFLAGS="-g -O2 -mtune=native -Wall -pedantic"            \
    FCFLAGS="-g -O2 -mtune=native -Wall -pedantic"           \
    CXXFLAGS="-g -O3 -Wall -pedantic -mtune=native -frtti"   \


RUN MAKEFLAGS=-j8 nice /opt/R-devel/bin/R -q -e 'options(repos = "https://cloud.r-project.org"); install.packages("dplyr", dependencies = TRUE)'

RUN apt-get -y install libssh2-1.dev

RUN MAKEFLAGS=-j8 nice /opt/R-devel/bin/R -q -e 'options(repos = "https://cloud.r-project.org"); install.packages(c("devtools", "testthat", "roxygen2"))'

RUN apt-get -y install libxml2-dev

RUN MAKEFLAGS=-j8 nice /opt/R-devel/bin/R -q -e 'options(repos = "https://cloud.r-project.org"); install.packages(c("devtools", "testthat", "roxygen2"))'

RUN apt-get -y install git

RUN apt-get -y install gdb

RUN MAKEFLAGS=-j8 nice /opt/R-devel/bin/R -q -e 'options(repos = "https://cloud.r-project.org"); devtools::install_github("hadley/testthat")'
