# Anth's dotfiles

## Usage

- Clone repo to your local.
- Review files and customize as you see fit, add any files you don't need or don't want to the `excludes.txt.` file.
- Install Homebrew.
  - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install basic set of homebrew packages.
  - `brew install bash bash-completion@2 git hub vim tmux`
- Complete instructions listed in Caveats of homebrew install.
- Change shell to the bash version installed by homebrew.
  - `sudo -s`
  - `echo /usr/local/bin/bash >> /etc/shells`
  - `chsh -s /usr/local/bin/bash`
  - `exec "$SHELL"` or restart your terminal
- Run `bash bootstrap.sh` to copy everything in the repo to your `$HOME` directory.
- (Optional) Install spacemacs
  - `brew tap d12frosted/emacs-plus`
  - `brew install emacs-plus`
  - `ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/`
  - `git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d`
- (Optional) Install language/tool specific packages
  - `brew install nvm python postgresql elixir`
  - [Install RVM](https://rvm.io/rvm/install)
  - Install desired node versions using `nvm`
  - Install desired ruby versions using `rvm`
- (Optional) Install tmuxinator
  - `gem install tmuxinator`
- (Optional) Install other useful stuff
  - `brew install jq awscli tree the_silver_searcher reattach-to-user-namespace`

## TODO
- Automate change shell step
- Maybe change setup so that `bootstrap.sh` just sets up the `$HOME` directory to point at this
repo's directory. For instance, copying a `.bash_profile` that points at the `.bashrc` in here.
- Document python dev environment setup with pyenv, virtualenv, and virtualenvwrapper
- Document `.secrets` setup/usage.
