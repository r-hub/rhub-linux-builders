## Emacs, make this -*- mode: sh; -*-

FROM rhub/ubuntu

MAINTAINER "r-hub admin" admin@r-hub.io

RUN add-apt-repository --remove -s -y multiverse && \
    add-apt-repository -s -y multiverse

RUN apt-get update && \
    apt-get -y build-dep -y r-base-dev

RUN apt-get -y install \
	libcurl4-openssl-dev \
	clang-3.8 \
	llvm-3.8-dev \
	clang\+\+-3.8 \
	clang \
	llvm-dev \
	libc++-dev \
        libc++abi-dev \
	python-pip \
	git

## Fix a bug in C++ string header file (libc++-dev)
## (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=808086)
RUN if md5sum /usr/include/c++/v1/string | grep -q bc206c6dee334d9d8d1cdcf32df6a92b; \
  then cp -p /usr/include/c++/v1/string /root/string.orig \
       && cd /usr/include/c++/v1/ \
       && echo $'\n\
--- orig/string 2017-03-29 03:44:51.270843442 -0400\n\
+++ hack/string 2017-03-29 03:45:23.678749561 -0400\n\
@@ -1936,6 +1936,11 @@\n\
 template <class _CharT, class _Traits, class _Allocator>\n\
 inline _LIBCPP_INLINE_VISIBILITY\n\
 basic_string<_CharT, _Traits, _Allocator>::basic_string(const allocator_type& __a)\n\
+#if _LIBCPP_STD_VER <= 14\n\
+    _NOEXCEPT_(is_nothrow_copy_constructible<allocator_type>::value)\n\
+#else\n\
+    _NOEXCEPT\n\
+#endif\n\
     : __r_(__a)\n\
 {\n #if _LIBCPP_DEBUG_LEVEL >= 2' | patch -p1; fi

## Install latest WLLVM scripts from GitHub
RUN pip install --upgrade pip  && \
    pip install setuptools wheel --upgrade

RUN chown -R docker:docker /opt

## The rest is done with an ordinary user
USER docker

RUN curl -L -o /opt/master.zip https://github.com/travitch/whole-program-llvm/archive/master.zip && \
    unzip /opt/master.zip -d /opt/ && \
    mv /opt/whole-program-llvm-master /opt/whole-program-llvm && \
    pip install wllvm --user

## Install rchk
RUN curl -L -o /opt/master2.zip https://github.com/kalibera/rchk/archive/master.zip && \
    unzip /opt/master2.zip -d /opt/ && \
    mv /opt/rchk-master/ /opt/rchk/ && \
    cd /opt/rchk/src && \
    make

ENV WLLVM=/home/docker/.local/bin
ENV LLVM=/usr/
ENV RCHK=/opt/rchk/

## Get R sources and configure rchk
RUN mkdir /opt/R-svn/ && \
    svn checkout https://svn.r-project.org/R/trunk /opt/R-svn && \
    cd /opt/R-svn/ && \
    /opt/rchk/scripts/build_r.sh

RUN apt-get install -y \
    qpdf \
    aspell \
    aspell-en

ENV CRAN http://cran.r-project.org

ENV RHUB_PLATFORM linux-x86_64-ubuntu-gcc
ENV RBINARY /opt/R-svn/bin/R
ENV PATH="/opt/R-svn/bin:${PATH}"
ENV PYTHONPATH="/home/docker/.local/lib/python2.7/site-packages"

RUN mkdir -p /opt/R-svn/packages/lib && \
    ln -s /opt/R-svn/packages/lib /home/docker/R

ADD rchk.sh /usr/local/bin

ENV RHUB_CHECK_COMMAND rchk.sh

CMD ["bash"]
