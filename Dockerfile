FROM dclong/jupyterlab

Run apt-get update \
    && apt-get -y --no-install-recommends install \
        r-base-dev \
        texlive texinfo \
    && apt-get autoremove \
    && apt-get autoclean

ADD Renviron.site /etc/R/Renviron.site

# install IRKernel
ADD install_irkernel.r /
RUN Rscript /install_irkernel.r \
    && rm /install_irkernel.r 

# install popular R packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        libxml2-dev \
        libcairo2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        openjdk-8-jdk r-cran-rjava \
    && apt-get autoremove \
    && apt-get autoclean

ADD install_packages.r /install_packages.r
RUN Rscript /install_packages.r \
    && rm /install_packages.r 

ADD script.sh /

