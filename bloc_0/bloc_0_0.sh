#!/bin/bash

# Iterate over the years
for year in $(seq 2011 2023); do
  # Iterate over the months
  for month in $(seq -w 01 12); do
    # Print the link
    echo "[bdn${year}${month}](.././bdn${year}/bdn${year}${month}.ipynb)   "
  done
done
