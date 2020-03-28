#!/usr/bin/env bash

# Load all the shell dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,secrets}; do
  [ -r "$file" ] && . "$file"
done;
unset file;

# Enable Homebrew bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# For bash completion
# . ~/.bin/.tmuxinator.bash;

# Append to bash history instead of overwriting
shopt -s histappend;

# Autocorrect typos in paths on cd command
shopt -s cdspell;

# Case-insensitive globbing
shopt -s nocaseglob;

# TODO: THIS MAY NOT BE NECESSARY ANYMORE
# Need this so SSH passphrase isn't constantly asked for in tmux sessions
# because Sierra sucks
ssh-add -A 2>/dev/null;

# For nvm installed via homebrew
# . $(brew --prefix nvm)/nvm.sh;

# For nvm installed via creationix install.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Initialize pyenv when a new shell is opened
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Initialize pyenv-virtualenv when a new shell is opened
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi

# Initialize pyenv-virtualenvwrapper when a new shell is opened
if which pyenv-virtualenvwrapper > /dev/null; then
  pyenv virtualenvwrapper;
fi

# Load RVM into a shell session *as a function*
# This must be at the end of the file to avoid a warning when
# running the rvm command
[[ -r "$HOME/.rvm/scripts/completion" ]] && \. "$HOME/.rvm/scripts/completion"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm"
