## Emacs, make this -*- mode: sh; -*-

## This as forked from https://github.com/rocker-org
## Thanks to Carl Boettiger and Dirk Eddelbuettel for creating these
## images.

FROM debian:testing

MAINTAINER "r-hub admin" admin@r-hub.io

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
		gcc-5 \
		g++-5 \
		gfortran-5 \
		less \
		locales \
		ca-certificates \
		curl \
		default-jdk \
		libbz2-dev \
		libcairo2-dev \
		libcurl4-openssl-dev \
		libicu-dev \
		libjpeg-dev \
		libpcre3-dev \
		libpng-dev \
		libreadline-dev \
		libtiff5-dev \
		libx11-dev \
		libxt-dev \
		lmodern \
		subversion \
		tcl8.6-dev \
		texinfo \
		texlive-base \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-latex-base \
		texlive-latex-recommended \
		tk8.6-dev \
		unzip \
		x11proto-core-dev \
		xvfb \
	&& rm -rf /var/lib/apt/lists/*

## Configure default locale,
## see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
