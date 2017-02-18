Markdownsite
===========

Markdownsite is a simple Github- and Travis-based system
for creating websites based on Markdown files.

## Getting started

1. [Create a new repository](https://github.com/new) on Github.
2. Import this repository:
   `https://github.com/samwilson/markdownsite-example.git`
3. Activate your new repository on Travis,
   via [your profile](https://travis-ci.org/profile/).
4. [Create a personal access token](https://github.com/settings/tokens) on Github
   with the "Access public repositories" scope.
5. Add two Travis environment variables:
   - the personal access token as `GH_TOKEN`
   - and your email address as `GH_EMAIL`
6. Browse to `https://USERNAME.github.io/REPONAME` (with your username and repository name substituted).

Every Markdown file (with file extension `.md`) in your repository
will be built into both an HTML and PDF version.

## Pushing to a different branch than 'gh-pages'

If you're using your base user repository `USERNAME/USERNAME.github.io`
then you need to keep your source Markdown files in a branch other than
`master`, because that's where the built HTML and PDF files will be pushed.

To inform Markdownsite of this, set the `GH_BRANCH` variable in Travis (step 5 above).

## Converting an existing repository to a markdownsite

Set your .travis.yml file to contain the following:

	language: bash
	sudo: required
	install:
	  - git clone https://github.com/samwilson/markdownsite.git
	script:
	  - markdownsite/travis-deploy.sh

Then, continue from set 4 above.

## Templates

There are two te

cp /usr/share/pandoc/data/templates/default.latex pdf.tpl
