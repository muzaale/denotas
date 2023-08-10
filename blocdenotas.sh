# User-defined inputs:
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your GitHub repository name: " REPO_NAME
read -p "Enter your email address: " EMAIL_ADDRESS
read -p "Enter your root directory (e.g., ~/Dropbox/1f.ἡἔρις,κ/1.ontology): " ROOT_DIR
read -p "Enter the name of the subdirectory to be built within the root directory: " SUBDIR_NAME
read -p "Enter your commit statement " COMMIT_THIS
read -p "Enter your SSH key path (e.g., ~/.ssh/id_yafefena): " SSH_KEY_PATH

# Build the book with Jupyter Book
cd "$(eval echo $ROOT_DIR)"
jb build $SUBDIR_NAME
rm -rf $REPO_NAME

if [ -d "$REPO_NAME" ]; then
  echo "Directory $REPO_NAME already exists. Choose another directory or delete the existing one."
  exit 1
fi

git clone "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
cp -r $SUBDIR_NAME/* $REPO_NAME
cd $REPO_NAME
git add ./*
git commit -m "$COMMIT_THIS"
chmod 600 "$(eval echo $SSH_KEY_PATH)"
git remote -v
ssh-add -D
git remote set-url origin "git@github.com:$GITHUB_USERNAME/$REPO_NAME"
ssh-add "$(eval echo $SSH_KEY_PATH)"
git push -u origin main
ghp-import -n -p -f _build/html
cd ..
rm -rf $REPO_NAME
echo "Jupyter Book content updated and pushed to $GITHUB_USERNAME/$REPO_NAME repository!"
