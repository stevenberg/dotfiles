if [ "$(uname -s)" = 'Darwin' ]; then
    HOMEBREW_PREFIX=/opt/homenbrew
else
    HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
fi

if [ -x $HOMEBREW_PREFIX/bin/brew ]; then
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi
