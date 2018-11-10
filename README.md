# Anth's dotfiles

## Usage

* Clone repo to your local
* Review files and customize as you see fit, delete any files you don't need or don't want.
* Run `bash bootstrap.sh` to copy everything in the repo to your `$HOME` directory
* Run `bash brew.sh` to install Homebrew and install homebrew packages.
* If you install the homebrew version of bash, change your shell to the bash version.
  * `sudo -s`
  * `echo /usr/local/bin/bash >> /etc/shells`
  * `chsh -s /usr/local/bin/bash
  * `exec "$SHELL"` or restart your terminal


## TODO
* Automate change shell step
* Add `ignore` file where the files that you don't want to use can be added, and `bootstrap.sh` will
not copy those files to your `$HOME` directory.
* Maybe change setup so that `bootstrap.sh` just sets up the `$HOME` directory to point at this
repo's directory. For instance, copying a `.bash_profile` that points at the `.bashrc` in here.
