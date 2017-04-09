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

ADD script.sh /
