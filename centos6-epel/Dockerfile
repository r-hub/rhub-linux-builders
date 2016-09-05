FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
