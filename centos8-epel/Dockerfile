FROM centos:8

RUN useradd docker

RUN \
  yum upgrade -y && \
  yum install -y 'dnf-command(config-manager)' && \
  yum config-manager --set-enabled PowerTools && \
  yum install -y epel-release && \
  yum install -y xorg-x11-server-Xvfb R-devel valgrind qpdf gcc-gfortran \
    glibc-langpack-en aspell aspell-en

RUN curl -o /usr/bin/pandoc.gz \
    https://files.r-hub.io/pandoc/linux-64/pandoc.gz && \
  gzip -d /usr/bin/pandoc.gz && \
  curl -o /usr/bin/pandoc-citeproc.gz \
    https://files.r-hub.io/pandoc/linux-64/pandoc-citeproc.gz && \
  gzip -d /usr/bin/pandoc-citeproc.gz && \
  chmod +x /usr/bin/pandoc /usr/bin/pandoc-citeproc

ENV RHUB_PLATFORM linux-x86_64-centos8-epel
