#!/bin/sh
#Small script to set up directories, bundler, gitignore and readme.md files for projects


echo Setting up project files...

# Directories
echo Making directories...
mkdir lib
touch main.rb

# Bundle stuff
echo Initializing bundle...
bundle init
echo Adding rspec and rubocop to bundle...
bundle add rspec
bundle add rubocop

# Rspec setup
echo Initializing rspec...
bundle exec rspec --init

# Git and readme
echo Setting up readme and gitignore files...
touch readme.md
echo todo > readme.md
touch .gitignore
echo $0 > .gitignore
echo /spec >> .gitignore
echo todo >> .gitignore

echo Calling git init...
git init

EXIT_MSG="\nSetup complete! Don't forget to:\n	1. Download project specific gems\n	2. Fix rubocop and rspec entries in gemfile\n	3. Fill out .readme\n	4. Update gitignore\n	5. Make initial commit\n		6. Set up remote repo"

echo $EXIT_MSG
