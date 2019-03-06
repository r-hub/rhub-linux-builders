FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel

RUN \
  yum install -y centos-release-scl && \
  yum install -y devtoolset-6-gcc-c++ devtoolset-6-gcc-gfortran.x86_64

RUN \
  yum install -y valgrind qpdf

RUN echo "source /opt/rh/devtoolset-6/enable" >> /etc/bashrc

RUN \
  curl -o /etc/yum.repos.d/rhub-pandoc-centos6.repo                   \
    https://files.r-hub.io/pandoc/centos6/rhub-pandoc-centos6.repo

RUN yum install -y pandoc pandoc-citeproc

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
