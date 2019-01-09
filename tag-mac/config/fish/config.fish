set -x HOMEBREW_INSTALL_CLEANUP 1
set -x BROWSER 'open'
set -x CDPATH . "$HOME/dev/repos"
set -x EDITOR 'vim'
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
set -x GOPATH "$HOME/go"
set -x GOROOT "/usr/local/opt/go"
set -x GREP_OPTIONS '--color=auto'
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR
set -x RUBY_CONFIGURE_OPTS --with-jemalloc

umask 022

abbr -a ax chmod a+x
abbr -a lr ls -R

set fish_greeting

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
