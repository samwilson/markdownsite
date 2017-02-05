#!/bin/bash

## Make sure required environment variables are set.
if [[ -z "$GH_TOKEN" || -z "$GH_EMAIL" ]]; then
	echo "Please set GH_TOKEN and GH_EMAIL environment variables in Travis"
	exit 1
fi

## Install LaTeX.
sudo apt-get update
sudo apt-get install -y texlive-latex-recommended

## Install latest Pandoc.
PANDOC_DEB=pandoc-1.17.2-1-amd64.deb
wget https://github.com/jgm/pandoc/releases/download/1.17.2/$PANDOC_DEB
sudo dpkg -i $PANDOC_DEB
rm $PANDOC_DEB

## Get the site's repository name.
REPO_URL=$(git remote -v | grep push | awk '{print $2}' | grep -o 'github\.com[:/][^/]*/.*\.git')
echo "Repository is $REPO_URL"

## Build the site, then commit the built files to the master branch.
markdownsite/build.sh .
cd "$TRAVIS_BUILD_DIR/public"
git init
git config user.name "Travis CI"
git config user.email "$GH_EMAIL"
git add -A \*.html \*.pdf \*.css
git commit -m"Files built by Travis."

## Push the changes back to Github.
git push -f "https://"$GH_TOKEN"@"$REPO_URL master:gh-pages
