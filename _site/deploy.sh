#!/bin/bash
#
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project. 
jekyll build

cp CNAME _site

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin gh-pages
git subtree push --prefix=_site git@github.com:opusonemusicstudio/opusonemusicstudio.github.io.git gh-pages