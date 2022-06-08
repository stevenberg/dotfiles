set -x ANSIBLE_ROLES_PATH "$HOME/.ansible/roles"
set -x BROWSER 'open'
set -x CDPATH . "$HOME/Development/Projects"
set -x EDITOR 'vim'
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -x GOPATH "$HOME/Development/Go"
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
    /Applications/MacVim.app/Contents/bin \
    /Users/steven/Library/Python/3.7/bin \
    /Users/steven/.cargo/bin \
    /Users/steven/.composer/vendor/bin \
    /Users/steven/Development/Go/bin \
    /Users/steven/.rbenv/bin \
    /Users/steven/bin \
    $PATH

starship init fish | source

if type -q rbenv
    source (rbenv init -|psub)
end

if type -q direnv
    source (direnv hook fish|psub)
end

for path in $HOME/.config/fish/config.d/*.fish
    source $path
end

if test $TERM_PROGRAM = 'iTerm.app'; and status is-interactive
    source $HOME/.config/iterm2/shell_integration.fish
end

function set_terminal_color --on-event fish_prompt
    if test (light-or-dark) = light
        base16-default-light
    else
        base16-default-dark
    end
end
