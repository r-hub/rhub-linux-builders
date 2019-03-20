## Emacs, make this -*- mode: sh; -*-

FROM ubuntu:16.04

MAINTAINER "r-hub admin" admin@r-hub.io

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
	        software-properties-common \
	&& apt-add-repository multiverse

## Set a default user. Available via runtime flag
## Add user to 'staff' group, granting them write privileges to
## /usr/local/lib/R/site.library
## User should also have & own a home directory
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	        bison \
		ca-certificates \
		curl \
		debhelper \
		default-jdk \
		ghostscript \
		groff-base \
		less \
		libblas-dev \
		libbz2-dev \
		libcairo2-dev \
		libcurl4-openssl-dev \
		libicu-dev \
		libjpeg-dev \
		liblapack-dev \
		liblzma-dev \
		libncurses5-dev \
		libpango1.0-dev \
		libpcre3-dev \
		libpng-dev \
		libreadline-dev \
		libtiff5-dev \
		libx11-dev \
		libxt-dev \
		lmodern \
		locales \
		mpack \
		qpdf \
		subversion \
		tcl8.6-dev \
		texinfo \
		texlive-base \
		texlive-extra-utils \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-generic-recommended \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-latex-recommended \
		tk8.6-dev \
		valgrind \
		unzip \
		x11proto-core-dev \
		xauth \
		xdg-utils \
		xfonts-base \
		xfonts-100dpi \
		xfonts-75dpi \
		xvfb \
		zlib1g-dev


## Configure default locale,
## see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN apt-get install -y --no-install-recommends valgrind

RUN apt-get install -y --no-install-recommends qpdf

RUN curl -o /usr/local/bin/pandoc.gz \
         https://files.r-hub.io/pandoc/linux-64/pandoc.gz && \
    gzip -d /usr/local/bin/pandoc.gz && \
    curl -o /usr/local/bin/pandoc-citeproc.gz \
	 https://files.r-hub.io/pandoc/linux-64/pandoc-citeproc.gz && \
    gzip -d /usr/local/bin/pandoc-citeproc.gz && \
    chmod +x /usr/local/bin/pandoc /usr/local/bin/pandoc-citeproc

RUN apt-get install -y aspell aspell-en

RUN rm -rf /var/lib/apt/lists/*

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
