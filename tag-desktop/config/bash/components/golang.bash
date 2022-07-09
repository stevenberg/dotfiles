if [ -d "$HOMEBREW_PREFIX"/opt/go/libexec ] && [ -d "$HOME"/Development/Go ]; then
    export GOPATH="$HOME"/Development/Go
    export GOROOT=$HOMEBREW_PREFIX/opt/go/libexec
    PATH=$HOME/Development/Go/bin:$PATH
fi
