#!/bin/bash

# Path to the Python interpreter that works
python_path="/usr/local/anaconda3/bin/python"

# Check if the specified path is indeed a Python 3 interpreter
if $python_path -c 'import sys; exit(sys.version_info < (3,))' 2>/dev/null; then
    echo "Found Python 3 interpreter at $python_path"

    # Install anytree using pip corresponding to the specified Python interpreter
    echo "Installing anytree for $python_path"
    $python_path -m pip install anytree
else
    echo "The specified path does not point to a Python 3 interpreter. Aborting."
fi

echo "Done."


pwd
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology 
jb build bloc
cp -r bloc/* denotas
cd denotas
git add ./*
git commit -m "fancy: # Path to the Python interpreter that works
python_path="/usr/local/anaconda3/bin/python""
chmod 600 ~/.ssh/id_blocdenotas
git remote -v
ssh-add -D
git remote set-url origin git@github.com:muzaale/denotas 
ssh-add ~/.ssh/id_blocdenotas
bloc 
git push 
ghp-import -n -p -f _build/html