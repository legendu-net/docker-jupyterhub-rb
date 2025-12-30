FROM dclong/jupyterhub

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends \
        r-base-dev \
    && apt-get autoremove \
    && apt-get autoclean

ADD settings/Renviron.site /etc/R/Renviron.site

# install R package dependencies
RUN apt-get -y update \
    && apt-get -y install --no-install-recommends \
        libxml2-dev \
        libcairo2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
    && apt-get autoremove -y \
    && apt-get autoclean -y

# install IRKernel
ADD scripts /scripts
RUN Rscript /scripts/install_irkernel.r


