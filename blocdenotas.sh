#!/bin/bash

# Default SSH Key path; did this mess things up?
DEFAULT_SSH_KEY_PATH="/users/d/.ssh/id_blocdenotas"

# Prompt user for the path to their private SSH key
read -p "Enter the path to your private SSH key [default: $DEFAULT_SSH_KEY_PATH]: " SSH_KEY_PATH

# If user doesn't input anything, use the default
SSH_KEY_PATH=${SSH_KEY_PATH:-$DEFAULT_SSH_KEY_PATH}

if [[ ! -f "$SSH_KEY_PATH" ]]; then
    echo "Error: SSH key not found at $SSH_KEY_PATH."
    exit 1
fi

# Use the specified SSH key for git operations in this script
export GIT_SSH_COMMAND="ssh -i $SSH_KEY_PATH"

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
git commit -m "automate updates to denotas, with default SSH key"

# Ensure using the SSH URL for the repository
git remote set-url origin git@github.com:muzaale/denotas

# Push changes to GitHub
git push origin main

# Import the built HTML to gh-pages and push to GitHub
ghp-import -n -p -f _build/html
