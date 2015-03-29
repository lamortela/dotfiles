#!/usr/bin/env bash

# Load all the shell dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,bashrc}; do
  [ -r "$file" ] && source "$file"
done
unset file
