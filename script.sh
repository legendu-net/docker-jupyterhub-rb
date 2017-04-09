#!/bin/bash

Rscript -e 'IRkernel::installspec()'
jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/jupyter

