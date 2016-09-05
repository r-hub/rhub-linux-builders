FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel

RUN \
  yum install -y centos-release-scl && \
  yum install -y devtoolset-4-gcc-c++

RUN echo "source /opt/rh/devtoolset-4/enable" >> /etc/bashrc

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
