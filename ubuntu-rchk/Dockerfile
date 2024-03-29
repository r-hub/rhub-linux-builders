## Emacs, make this -*- mode: sh; -*-

FROM rhub/ubuntu

MAINTAINER "r-hub admin" admin@r-hub.io

RUN add-apt-repository --remove -s -y multiverse && \
    add-apt-repository -s -y "deb http://archive.ubuntu.com/ubuntu/ focal multiverse" && \
    add-apt-repository -s -y "deb http://archive.ubuntu.com/ubuntu/ focal universe"

RUN apt-get update && \
    apt-get -y build-dep -y r-base-dev

RUN apt-get install -y clang-12 llvm-12-dev '^clang++-12$' llvm-12 libllvm12 libc++-12-dev libc++abi-12-dev

RUN apt-get install -y python3-pip git rsync

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

## Install latest WLLVM scripts
RUN pip3 install wllvm

## The rest is done with an ordinary user
USER docker
WORKDIR /home/docker

## Install rchk
RUN git clone -b llvm11 https://github.com/kalibera/rchk.git
RUN cd rchk/src ; make ; cd ..

ENV WLLVM=/usr/local/bin
ENV LLVM=/usr/lib/llvm-12
ENV RCHK=/home/docker/rchk

RUN cd /home/docker/rchk/src && \
    echo 'export WLLVM=/usr/local/bin'    > ../scripts/config.inc && \
    echo 'export LLVM=/usr/lib/llvm-12' >> ../scripts/config.inc && \
    echo 'export RCHK=/home/docker/rchk' >> ../scripts/config.inc && \
    make

## Get R sources and configure rchk
RUN mkdir /home/docker/R-svn/ && \
    svn checkout https://svn.r-project.org/R/trunk /home/docker/R-svn

RUN cd /home/docker/R-svn/ && \
    /home/docker/rchk/scripts/build_r.sh

ENV CRAN http://cran.r-project.org

ENV RHUB_PLATFORM linux-x86_64-ubuntu-gcc
ENV RBINARY /home/docker/R-svn/bin/R
ENV PATH="/home/docker/R-svn/bin:${PATH}"
ENV PYTHONPATH="/home/docker/.local/lib/python2.7/site-packages"

RUN mkdir -p /home/docker/R-svn/packages/lib && \
    ln -s /home/docker/R-svn/packages/lib /home/docker/R

ADD bashrc /home/docker/.bashrc
ADD bashrc /home/docker/.bash_profile

## RUN chmod +x /home/docker/.bashrc /home/docker/.bash_profile

ADD rchk.sh /usr/local/bin

ENV RHUB_CHECK_COMMAND rchk.sh

CMD ["bash"]
