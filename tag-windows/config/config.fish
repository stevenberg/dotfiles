set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR
set -x RUBY_CONFIGURE_OPTS --with-jemalloc

umask 022

set fish_greeting

if type -q direnv
    source (direnv hook fish|psub)
end
