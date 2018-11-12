#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

doIt() {
  rsync --exclude-from 'excludes.txt' -avh --no-perms . ~;
}

pretendToDoIt() {
  rsync --dry-run --exclude-from 'excludes.txt' -avh --no-perms . ~;
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
