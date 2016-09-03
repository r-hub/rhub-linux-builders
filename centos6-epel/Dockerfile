FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y R-devel

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
