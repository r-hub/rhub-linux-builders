FROM centos:centos8

RUN useradd docker

RUN dnf -y install dnf-plugins-core

RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

RUN dnf config-manager --set-enabled powertools

RUN dnf -y install xorg-x11-server-Xvfb R-devel valgrind qpdf

RUN dnf -y install aspell aspell-en pandoc

RUN dnf -y install glibc-langpack-en

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
