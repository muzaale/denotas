#!/bin/bash

# Create the bdnsh directory if it doesn't exist
mkdir -p bdnsh

# Find and move all .sh files into the bdnsh directory
find . -maxdepth 1 -type f -iname "*.sh" -exec mv {} bdnsh/ \;

