#!/usr/bin/env bash
while IFS=" " read -r package version;
do
  Rscript -e "devtools::install_version('"$package"', version='"$version"')";
done < "r_requirements.txt"
