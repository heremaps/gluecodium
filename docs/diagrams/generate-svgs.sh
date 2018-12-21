#!/bin/bash
#
# Convert .dia files to SVGs, dia must be installed
#

for DIA in *.dia; do
    dia --export=${DIA%%.dia}.svg $DIA;
done

