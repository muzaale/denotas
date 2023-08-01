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
git commit -m "+ chilli-fried whole jerk snapper. is that a thing? quick google says yes.

### 833. eddie

Kadi and Mark…    
+ The square root of the number of employees you employ will do most of the work… 
+ 5 classical composers created 95% of the classical music that’s played 
+ and yet if you look at their music, only 5% of their music is what’s played 95% of the time”…. 
+ Debate"

# Push changes to GitHub
# git remote set-url origin git@github.com:muzaale/amagunju
# ngalabi

git push 
ghp-import -n -p -f _build/html






