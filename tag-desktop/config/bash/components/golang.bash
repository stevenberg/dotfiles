if [ -d "$HOMEBREW_PREFIX"/opt/go/libexec ] && [ -d "$HOME"/Developer/Go ]; then
    export GOPATH="$HOME"/Developer/Go
    export GOROOT=$HOMEBREW_PREFIX/opt/go/libexec
    PATH=$HOME/Developer/Go/bin:$PATH
fi
