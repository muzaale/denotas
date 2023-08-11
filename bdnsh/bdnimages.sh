#!/bin/bash

# Create the bdnimages directory if it doesn't exist
mkdir -p bdnimages

# Find and move all .jpg, .jpeg, and .png files into the bdnimages directory
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec mv {} bdnimages/ \;

