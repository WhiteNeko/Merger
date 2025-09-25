# Merger
Mergest Projects into one big repo... Compatible with sparse-checkout 

# --- Docstring ---
# Script to automate adding a project as a Git subtree to a local repository.
# It fetches a project from a remote URL, adds it as a subdirectory, and
# pushes the changes to the main remote. The script automatically detects the
# remote's default branch.
#
# Arguments:
#   $1 (remote_url)    : The URL of the remote Git repository to add.
#   $2 (local_git_repo): The path to the local Git repository where the project will be added.
#   $3 (folder_to_store): The name of the parent folder within the local repository.
#   $4 (repo_name)     : The name of the subdirectory and the temporary remote.
#
# Example Usage:
#   ./add_project.sh <URL> /path/to/local/repo projects my-project-name
#   <URL> also works as the local URL like C:/Users/Local/Repo 
# --- End of Docstring ---
