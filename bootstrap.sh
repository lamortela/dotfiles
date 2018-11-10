#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE.md" --exclude "sublime/" \
        --exclude "brew.sh" -avh --no-perms . ~;
}

pretendToDoIt() {
  rsync --dry-run --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE.md" --exclude "sublime/" \
        --exclude "brew.sh" -avh --no-perms . ~;
}

if [ "$1" == "--dry-run" ]; then
  pretendToDoIt;
else
  if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
  else
    read -p "This will overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      doIt;
    fi;
  fi;
fi;

unset doIt;
unset pretendToDoIt;
