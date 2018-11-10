#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";


# Install packages
brew update;

brew upgrade --all;

brew install brew-cask;

brew install bash;
brew install bash-completion;

brew install git;
brew install hub;

brew install vim;
brew install tmux;
brew install tree;

brew install python;
brew install postgresql;
# brew install sqlite;
brew install nvm;

# brew install ctags;
# brew install qt;

brew cleanup;

