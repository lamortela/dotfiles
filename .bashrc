#!/usr/bin/env bash

# Enable Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Append to bash history instead of overwriting
shopt -s histappend;

# Autocorrect typos in paths on cd command
shopt -s cdspell;

# Case-insensitive globbing
shopt -s nocaseglob;

# For nvm installed via homebrew
source $(brew --prefix nvm)/nvm.sh;

# Load RVM into a shell session *as a function*
# This must be at the end of the file to avoid a warning when
# running the rvm command
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
