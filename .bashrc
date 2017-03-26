#!/usr/bin/env bash

# Load all the shell dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,secrets}; do
  [ -r "$file" ] && source "$file"
done;
unset file;

# Enable Homebrew bash completion
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

# For bash completion
source ~/.tmuxinator.bash;

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
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
