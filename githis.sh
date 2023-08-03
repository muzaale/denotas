#!/bin/bash

# Function to reset to a clean state.
reset_state() {
    # Abort any ongoing rebase.
    git rebase --abort &> /dev/null && echo "Aborted an ongoing rebase."

    # Stash any unstaged changes to ensure operations can proceed.
    git stash save "Unstaged changes before running githis.sh" && echo "Stashed unsaved changes."

    # Remove any lingering rebase directories.
    if [ -d ".git/rebase-merge" ] || [ -d ".git/rebase-apply" ]; then
        rm -rf .git/rebase-*
        echo "Removed lingering rebase directories."
    fi
}

# Navigate to the main working directory.
cd ~/dropbox/1f.ἡἔρις,κ/1.ontology

# Navigate to the six100 directory.
cd six100 || { echo "Directory six100 does not exist. Exiting."; exit 1; }

# Reset to a clean state.
reset_state

# Fetch the latest changes from temp_og_repo using SSH.
if git fetch git@github.com:afecdvi/temp_og_repo.git main; then
    echo "Successfully fetched changes via SSH."
else
    echo "Failed to fetch changes using SSH. Exiting."
    exit 1
fi

# Reset the local branch to match the fetched changes.
git reset --hard FETCH_HEAD
echo "Local branch reset to match fetched changes."

# Check for network connection.
if ! ping -c 1 google.com &> /dev/null; then
    echo "No internet connection. Exiting."
    exit 1
fi

# Check repository size.
REPO_SIZE=$(du -sh .git | cut -f1)
echo "Repository size: $REPO_SIZE"

# Adjust Git configurations.
POST_BUFFER_SIZE=$(( (RANDOM % 200 + 300) * 1048576 ))
LOW_SPEED_LIMIT=$(( RANDOM % 5000 + 2000 ))
LOW_SPEED_TIME=$(( RANDOM % 60 + 30 ))

git config http.postBuffer $POST_BUFFER_SIZE
git config http.lowSpeedLimit $LOW_SPEED_LIMIT
git config http.lowSpeedTime $LOW_SPEED_TIME
echo "Adjusted Git's buffer size to $POST_BUFFER_SIZE, low speed limit to $LOW_SPEED_LIMIT and low speed time to $LOW_SPEED_TIME."

# Push the changes to the remote repository using SSH and verbose logging.
if git push git@github.com:afecdvi/og.git main --force -v; then
    echo "Successfully pushed changes using SSH."
    # Unstash any changes we stashed earlier.
    git stash pop &> /dev/null && echo "Restored previously stashed changes."
    echo "Script completed successfully!"
else
    echo "Failed to push changes even with SSH. Exiting."
    git stash pop &> /dev/null && echo "Restored previously stashed changes."
    exit 1
fi
