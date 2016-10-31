FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel valgrind qpdf gcc-gfortran

RUN \
  curl -o /etc/yum.repos.d/rhub-pandoc-centos6.repo                   \
    https://files.r-hub.io/pandoc/centos6/rhub-pandoc-centos6.repo

RUN yum install -y pandoc pandoc-citeproc

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
