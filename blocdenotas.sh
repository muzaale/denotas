#!/bin/bash

pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "### 840. learning, Installing collected packages: webcolors, urllib3, more-itertools, jsonpickle, joblib, idna, charset-normalizer, chardet, certifi, requests, music21
Successfully installed certifi-2023.7.22 chardet-5.2.0 charset-normalizer-3.2.0 idna-3.4 joblib-1.3.1 jsonpickle-3.0.1 more-itertools-10.1.0 music21-9.1.0 requests-2.31.0 urllib3-2.0.4 webcolors-1.13"
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html