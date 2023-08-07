#!/bin/bash

pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "### 905. fena

0. dramatis personae - players
1. project overview:
   - git
   - code
   - manuscript
2. skills:
   - python
   - ai
   - r
   - stata
   - `numeracy`
   - 2.1 estimates
      + nonparametric
      + semiparametric
      + parametric
      + simulation
      + users/abuses
   - 2.2 variance
      + oneway
      + twoway
      + multivariable
      + hierarchical
      + clinical
      + public
3. challenges:
   - truth
   - rigor
   - error
   - sloppiness
   - fraud
   - learning
   - `literacy`
5. epilogue - the daily grind"
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html