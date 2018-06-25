#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

gitPull() {
  local status=$(git status -b --porcelain 2> /dev/null || git status --porcelain 2> /dev/null)

  if [[ -z "${status}" ]]; then
    git pull origin master;
  else
    echo "Changes found, skipping git pull."
  fi;
}

doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE.md" --exclude "sublime/" \
	      -avh --no-perms . ~;
}

pretendToDoIt() {
  rsync --dry-run --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE.md" --exclude "sublime/" \
	      -avh --no-perms . ~;
}

if [ "$1" == "--dry-run" ]; then
  pretendToDoIt;
else
  if [ "$1" == "--force" -o "$1" == "-f" ]; then
    gitPull;
    doIt;
  else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      gitPull;
      doIt;
    fi;
  fi;
fi;

unset gitPull;
unset doIt;
unset pretendToDoIt;
