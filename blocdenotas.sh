pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "### 894. agift2me

spjd note-taking & updates import nbformat
import os

# Define the path to the input and output files
input_path = os.path.expanduser('~/dropbox/1f.ἡἔρις,κ/1.ontology/be/be_6/be_i7_8.ipynb')
output_path = os.path.expanduser('~/dropbox/1f.ἡἔρις,κ/1.ontology/populate_fe.ipynb')"
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html