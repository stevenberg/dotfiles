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

### App Store Apps

- 1Blocker
- 1Password for Safari
- ColorSnapper 2
- Contrast
- Deliveries
- Hush
- Icon Slate
- Moom
- Numbers
- Pages
- Soulver 3
- Speedtest
- StopTheMadness
- Tot
- Vinegar
- Wireguard
- WorldWideWeb
- Xcode

### Download Apps

- [1Password](https://support.1password.com/get-the-apps/)
- [Acorn](https://flyingmeat.com/acorn/)
- [Arq](https://www.arqbackup.com)
- [Carbon Copy Cloner](https://bombich.com)
- [DaisyDisk](https://daisydiskapp.com)
- [Discord](https://discord.com)
- [Docker](https://www.docker.com/get-started/)
- [FastScripts](https://redsweater.com/fastscripts/)
- [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)
- [Firefox Nightly](https://www.mozilla.org/en-US/firefox/channel/desktop/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Geekbench](https://www.geekbench.com)
- [Google Chrome Beta](https://www.google.com/chrome/beta/)
- [Google Chrome Canary](https://www.google.com/chrome/canary/)
- [Google Chrome Dev](https://www.google.com/chrome/dev/)
- [Google Chrome](https://www.google.com/chrome/)
- [ImageOptim](https://imageoptim.com/mac)
- [iTerm](https://iterm2.com)
- [Lectrote](https://github.com/erkyrath/lectrote/releases)
- [Microsoft Edge Beta](https://www.microsoftedgeinsider.com/en-us/download/beta)
- [Microsoft Edge Canary](https://www.microsoftedgeinsider.com/en-us/download/canary)
- [Microsoft Edge](https://www.microsoft.com/en-us/edge)
- [NetNewsWire](https://netnewswire.com)
- [PixelSnap](https://licenses.maketheweb.io/download/pixelsnap2)
- [Safari Technology Preview](https://developer.apple.com/safari/resources/)
- [Transmit](https://www.panic.com/transmit/)
- [Visual Studio Code](https://code.visualstudio.com/Download)

## Linux Stuff

```
rcup -t desktop -t linux -t excel
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo add-apt-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install \
    bison \
    build-essential \
    fish \
    git \
    libcurl4-openssl-dev \
    libgd-dev \
    libjemalloc-dev \
    libonig-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libzip-dev \
    plocate \
    rcm \
    re2c \
    vim-nox \
    zlib1g-dev
sudo corepack enable
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew bundle --global
```
