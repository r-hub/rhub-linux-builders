FROM rocker/r-devel-san:latest

RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

ENV RHUB_PLATFORM linux-x86_64-rocker-gcc-san
ENV RBINARY /usr/local/bin/RD
