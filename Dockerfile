FROM dclong/jupyterlab

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-add-repository -y "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        # install R and dependencies of R packages required by IRKernel
        r-base-dev \
        libssl-dev libcurl4-openssl-dev libxml2-dev libcairo2-dev \
        texlive texinfo texlive-fonts-extra \
        openjdk-8-jdk r-cran-rjava \
    && apt-get autoremove \
    && apt-get autoclean 

# R configure -- must be done before installing packages
ADD Renviron.site /
RUN mv /Renviron.site /etc/R/ 

# install IRKernel
ADD install_irkernel.r /
RUN Rscript /install_irkernel.r \
    && rm /install_irkernel.r 

# install popular R packages
ADD install_packages.r /
RUN Rscript /install_packages.r \
    && rm /install_packages.r 

ADD script.sh /
