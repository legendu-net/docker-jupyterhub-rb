FROM dclong/jupyterlab

Run apt-get update \
    && apt-get -y --no-install-recommends install \
        r-base-dev \
        texlive texinfo \
    && apt-get autoremove \
    && apt-get autoclean

ADD Renviron.site /etc/R/Renviron.site

# install R package dependencies
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        libxml2-dev \
        libcairo2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
    && apt-get autoremove \
    && apt-get autoclean

# install IRKernel
ADD install_irkernel.r /
RUN Rscript /install_irkernel.r \
    && rm /install_irkernel.r 

ADD script.sh /

