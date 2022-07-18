## Emacs, make this -*- mode: sh; -*-

FROM ubuntu:20.04

MAINTAINER "r-hub admin" admin@r-hub.io

## Copy 'checkbashisms' (as a local copy from devscripts package)
COPY checkbashisms /usr/local/bin

## Do not cache, do make Docker layers smaller
RUN echo Dir::Cache ""; >> /etc/apt/apt.conf.d/02nocache &&
    echo Dir::Cache::archives ""; >> /etc/apt/apt.conf.d/02nocache

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
                aspell \
                aspell-en \   
		curl \
		debhelper \
		default-jdk \
		ghostscript \
		groff-base \
		less \
		lmodern \
		locales \
		mpack \
		qpdf \
		texinfo \
		texlive-base \
		texlive-extra-utils \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-latex-recommended \
		valgrind \
		unzip \
		xauth \
		xdg-utils \
		xfonts-base \
		xfonts-100dpi \
		xfonts-75dpi \
		xvfb


## Configure default locale,
## see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN rm -rf /var/lib/apt/lists/*

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
