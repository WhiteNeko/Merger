#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <remote_url> <folder_to_store> <repo_name> <local_git_repo>"
    exit 1
fi

# Define arguments
REMOTE_URL=$1
LOCAL_REPO=$2
FOLDER=$3
REPO_NAME=$4

# Navigate to the specified local repository
if [ -d "$LOCAL_REPO" ]; then
    cd "$LOCAL_REPO" || exit
else
    echo "Error: The local repository '$LOCAL_REPO' does not exist."
    exit 1
fi

# Create the specified folder if it doesn't exist
if [ ! -d "$FOLDER" ]; then
    mkdir -p "$FOLDER"
    echo "Created directory '$FOLDER'."
fi

# Add the remote
git remote add "$REPO_NAME" "$REMOTE_URL"

# Find the default branch (HEAD)
HEAD_BRANCH=$(git remote show "$REPO_NAME" | grep 'HEAD branch' | awk '{print $NF}')

# Use git subtree to add the project
echo "Adding $REPO_NAME as a subtree with prefix $FOLDER/$REPO_NAME"
git subtree add --prefix="$FOLDER/$REPO_NAME" "$REPO_NAME" "$HEAD_BRANCH" --squash

# Remove the temporary remote
git remote remove "$REPO_NAME"

# Push changes to your main remote
git push

echo "Successfully added $REPO_NAME to your repository."
