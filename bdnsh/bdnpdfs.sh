#!/bin/bash

# Create the bdnpdfs directory if it doesn't exist
mkdir -p bdnpdfs

# Find and move all .pdf files into the bdnpdfs directory
find . -maxdepth 1 -type f -iname "*.pdf" -exec mv {} bdnpdfs/ \;

