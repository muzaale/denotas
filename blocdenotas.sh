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
git commit -m "### 857. g.o.a.t.

+ man's [greatest](goat.jpg) invention
+ a mere 88 keys
+ piano"

# Push changes to GitHub
# git remote set-url origin git@github.com:muzaale/amagunju
# ngalabi

git push 
ghp-import -n -p -f _build/html






