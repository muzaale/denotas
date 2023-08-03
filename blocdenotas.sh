#!/bin/bash

# Change directory to ~/dropbox/1f.ἡἔρις,κ/1.ontology
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology

# Build Jupyter Book with 'gano' as the argument
jb build bloc
cp -r bloc/* denotas

# Change directory to 'denotas'
cd denotas

# Add all files in the current directory to Git
git add ./*

# Commit changes to Git with the given commit message
git commit -m "#860: pwomd"

# Ensure using the SSH URL for the repository
git remote set-url origin git@github.com:muzaale/denotas.git

# Push changes to GitHub
git push origin main

# Import the built HTML to gh-pages and push to GitHub
ghp-import -n -p -f _build/html







