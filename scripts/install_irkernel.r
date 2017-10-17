#!/usr/bin/env Rscript

pkgs = '
    repr
    IRdisplay
    crayon
    pbdZMQ
    devtools
'
pkgs = strsplit(pkgs, '\\s')[[1]]
pkgs = pkgs[pkgs != '']
install.packages(pkgs, repos = 'https://cran.rstudio.org')
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec(user = FALSE)

