#!/bin/bash

# Ask the user for the path to the SSH key
read -p "Please provide the path to your SSH key (e.g. ~/.ssh/id_blocdenotas): " SSH_KEY_PATH

# If no input is provided, exit the script
if [[ -z "$SSH_KEY_PATH" ]]; then
    echo "No SSH key provided. Exiting."
    exit 1
fi

# Check if the SSH key exists
if [[ ! -f "$SSH_KEY_PATH" ]]; then
    echo "The provided SSH key does not exist. Exiting."
    exit 1
fi

# Change directory to ~/dropbox/1f.ἡἔρις,κ/1.ontology
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology

# Build Jupyter Book
jb build bloc
cp -r bloc/* denotas

# Change directory to 'denotas'
cd denotas

# Add all files in the current directory to Git
git add ./*

# Commit changes to Git with the given commit message
git commit -m "introducing SSH keys"

# Use the provided SSH key for the upcoming Git commands
export GIT_SSH_COMMAND="ssh -i $SSH_KEY_PATH"

# Ensure using the SSH URL for the repository
git remote set-url origin git@github.com:muzaale/denotas.git

# Push changes to GitHub
git push origin main

# Import the built HTML to gh-pages and push to GitHub
ghp-import -n -p -f _build/html

# Unset the custom GIT_SSH_COMMAND to avoid affecting other git operations
unset GIT_SSH_COMMAND
