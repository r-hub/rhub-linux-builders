FROM centos:centos6

RUN useradd docker

RUN \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel valgrind qpdf gcc-gfortran

RUN \
  curl -o /etc/yum.repos.d/rhub-pandoc-centos6.repo                   \
    https://files.r-hub.io/pandoc/centos6/rhub-pandoc-centos6.repo

RUN curl -o /usr/bin/pandoc.gz \
         https://files.r-hub.io/pandoc/linux-64/pandoc.gz && \
    gzip -d /usr/bin/pandoc.gz && \
    curl -o /usr/bin/pandoc-citeproc.gz \
	 https://files.r-hub.io/pandoc/linux-64/pandoc-citeproc.gz && \
    gzip -d /usr/bin/pandoc-citeproc.gz && \
    chmod +x /usr/bin/pandoc /usr/bin/pandoc-citeproc

RUN yum install -y aspell aspell-en

ENV RHUB_PLATFORM linux-x86_64-centos6-epel
