## Emacs, make this -*- mode: sh; -*-

FROM archlinux/base:latest

## Set a default user. Available via runtime flag
RUN useradd docker

RUN pacman -Syu --noconfirm

# installed in archlinux:base --
# ca-certificates curl bzip2 findutils pcre readline xz zlib
RUN pacman -S --noconfirm \
	gcc-fortran \
	less \
	jdk8-openjdk  \
	cairo \
	ghostscript \
    icu \
	libjpeg-turbo \
	pango \
	libpng \
	libtiff \
	libx11 \
    libxmu \
	libxt \
	make \
    r \
	subversion \
	tcl \
	texinfo \
	texlive-core \
	texlive-fontsextra \
	tk \
	unzip \
	xorgproto \
	tar \
	which \
	xorg-server-xvfb


RUN pacman -S --noconfirm valgrind

RUN pacman -S --noconfirm qpdf

#RUN curl -o /usr/bin/pandoc.gz \
#         https://files.r-hub.io/pandoc/linux-64/pandoc.gz && \
#    gzip -d /usr/bin/pandoc.gz && \
#    curl -o /usr/bin/pandoc-citeproc.gz \
#     https://files.r-hub.io/pandoc/linux-64/pandoc-citeproc.gz && \
#    gzip -d /usr/bin/pandoc-citeproc.gz && \
#    chmod +x /usr/bin/pandoc /usr/bin/pandoc-citeproc

RUN pacman -S --noconfirm pandoc pandoc-citeproc

RUN pacman -S --noconfirm aspell aspell-en

RUN pacman -S --noconfirm file

RUN pacman -S --noconfirm xorg-fonts-100dpi xorg-fonts-75dpi

RUN sed -i '/^#en_US.UTF-8/ s/^#//' /etc/locale.gen
RUN locale-gen
RUN echo LANG=en_US.UTF-8 > /etc/locale.conf

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

