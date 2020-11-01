#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

doIt() {
  rsync --exclude-from '.dotignore' -avh --no-perms . $HOME;
}

pretendToDoIt() {
  echo "Dry run of dotfile bootstrap, nothing will be changed"
  rsync --dry-run --exclude-from '.dotignore' -avh --no-perms . $HOME;
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
