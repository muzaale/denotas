#!/bin/bash

pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "automate after this -- ### 916. [workflow9.2](https://muzaale.github.io/repos/intro.html)

+ some really cool unix stuff
+ and then some .git also
+ `fena` git-like logo!"
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html