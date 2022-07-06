# dotfiles

```
git clone https://github.com/stevenberg/dotfiles.git ~/.dotfiles
rcup rcrc
git clone https://github.com/base16-project/base16-shell.git ~/.config/base16-shell
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
```

## Mac Stuff

```
rcup -t desktop -t mac -t excel
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew bundle --global
```

## Linux Stuff

```
rcup -t desktop -t linux -t excel
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo add-apt-repository ppa:ansible/ansible
sudo add-apt-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install \
    ansible \
    bat \
    build-essential \
    direnv \
    fish \
    fzf \
    git \
    libjemalloc-dev \
    nodejs \
    php8.1-cli \
    rcm \
    vim-nox
sudo corepack enable
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew bundle --global
```
