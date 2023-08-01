#!/bin/bash

# Change directory to ~/dropbox/1f.ἡἔρις,κ/1.ontology
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology

# Build Jupyter Book with 'gano' as the argument
jb build bloc
cp -r bloc/* denotas

# Change directory to 'amagunju'
cd denotas

# Add all files in the current directory to Git
git add ./*

# Commit changes to Git with the given commit message
git commit -m "### 829. boards

+ my scores are expired
+ i need to retake them
+ will be fun with ai 
+ consider a timeline
+ and with fenagas,llc?
+ just might have bandwidth
+ but its the synthesis of the two
+ that will be the most fun"

# Push changes to GitHub
# git remote set-url origin git@github.com:muzaale/amagunju
# ngalabi

git push 
ghp-import -n -p -f _build/html






