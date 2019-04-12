## Emacs, make this -*- mode: sh; -*-

FROM rhub/debian

## Configure default locale,
## see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get install -y --no-install-recommends \
         gcc \
         g++ \
         gfortran

RUN rm -rf /var/lib/apt/lists/*
