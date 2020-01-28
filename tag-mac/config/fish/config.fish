set -x BROWSER 'open'
set -x CDPATH . "$HOME/Development/repos"
set -x EDITOR 'vim'
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -x GOPATH "$HOME/Development/go"
set -x GOROOT '/usr/local/opt/go/libexec'
set -x HOMEBREW_INSTALL_CLEANUP 1
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR
set -x RUBY_CONFIGURE_OPTS '--with-jemalloc'

umask 022

set fish_greeting

set -x PATH \
    /usr/local/opt/python/libexec/bin \
    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin \
    /Applications/MacVim.app/Contents/bin \
    /Users/steven/Library/Python/3.7/bin \
    /Users/steven/.cargo/bin \
    /Users/steven/.composer/vendor/bin \
    /Users/steven/go/bin \
    /Users/steven/.rbenv/bin \
    /Users/steven/bin \
    $PATH

if status --is-interactive
    source $HOME/.config/iterm2/shell_integration.fish
end

if type -q rbenv
    source (rbenv init -|psub)
end

if type -q direnv
    source (direnv hook fish|psub)
end

for path in $HOME/.config/fish/config.d/*.fish
    source $path
end
