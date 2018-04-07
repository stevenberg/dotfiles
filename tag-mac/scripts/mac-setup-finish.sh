#!/bin/bash

set -euo pipefail

GO_VERSION='1.10.1'
RUBY_VERSION='2.5.1'

base16_default-dark
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
wget https://dl.google.com/go/go$GO_VERSION.darwin-amd64.tar.gz -O ~/src/go$GO_VERSION.darwin-amd64.tar.gz
cd /usr/local
sudo tar -xzf ~/src/go$GO_VERSION.darwin-amd64.tar.gz
curl https://sh.rustup.rs -sSf | sh
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
install-things ~/.dotfiles/gems.yml
install-things ~/.dotfiles/composer.yml
install-things ~/.dotfiles/pips.yml
