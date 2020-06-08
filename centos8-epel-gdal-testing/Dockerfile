FROM centos:centos8

RUN useradd docker

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

RUN yum update -y

RUN yum install -y R-core

RUN yum install -y gcc

RUN yum install -y yum-utils

RUN yum-config-manager --enable epel-testing

RUN yum config-manager --set-enabled PowerTools

RUN yum install -y R-devel

RUN yum install -y gdal-devel

RUN yum install -y proj-devel

RUN yum install -y sqlite-devel

RUN echo 'options(repos = c(CRAN = "https://cloud.r-project.org"))' >> /root/.Rprofile

## We can install rgdal

RUN R -q -e 'install.packages("rgdal")'

## Run the tests as well

RUN R -q -e 'install.packages("remotes")'

RUN yum install -y git

RUN git clone https://github.com/cran/rgdal

RUN yum install -y curl-devel udunits2-devel geos-devel cairo-devel

RUN R -q -e 'remotes::install_deps("rgdal", dependencies = TRUE)'
