if [ "$(uname -s)" = 'Darwin' ]; then
    HOMEBREW_PREFIX=/opt/homenbrew
else
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
fi

if [ -x $HOMEBREW_PREFIX/bin/brew ]; then
    export HOMEBREW_INSTALL_CLEANUP=1
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi
