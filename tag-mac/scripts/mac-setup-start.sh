#!/bin/bash

set -euo pipefile

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cd ~/.dotfiles
brew bundle
git submodule init
git submodule update
rcup rcrc
rcup -t mac
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/rbenv-each.git ~/.rbenv/plugins/rbenv-each
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git clone https://github.com/tpope/rbenv-aliases.git ~/.rbenv/plugins/rbenv-aliases
git clone https://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
