#!/bin/bash

# Create the bdnpy directory if it doesn't exist
mkdir -p bdnpy

# Find and move all .py files into the bdnpy directory
find . -maxdepth 1 -type f -iname "*.py" -exec mv {} bdnpy/ \;

