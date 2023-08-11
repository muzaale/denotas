#!/bin/bash

# Create the bdncsv directory if it doesn't exist
mkdir -p bdncsv

# Find and move all .csv files into the bdncsv directory
find . -maxdepth 1 -type f -iname "*.csv" -exec mv {} bdncsv/ \;

