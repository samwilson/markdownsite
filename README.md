markdownsite
===========

To create a simple website based on Markdown files:

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
7. Browse to `https://USERNAME.github.io/REPONAME` (with your username and repository name substituted).

Every Markdown file (with file extension `.md`) in your repository
will be built into both an HTML and PDF version.
