set -x ANSIBLE_ROLES_PATH "$HOME/.ansible/roles"
set -x BROWSER open
set -x CDPATH . "$HOME/Development/Projects" "$HOME/Development/Excel/Projects"
set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -x GOPATH "$HOME/Development/Go"
set -x GOROOT /opt/homebrew/opt/go/libexec
set -x HOMEBREW_INSTALL_CLEANUP 1
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR
set -x RUBY_CONFIGURE_OPTS --with-jemalloc

umask 022

set fish_greeting

eval (/opt/homebrew/bin/brew shellenv)

fish_add_path -m $HOME/bin
fish_add_path -m $HOME/.composer/vendor/bin
fish_add_path -m $HOME/Development/Go/bin
fish_add_path -m $HOME/.cargo/bin
fish_add_path -m /opt/homebrew/opt/python/libexec/bin

if status is-interactive
    starship init fish | source

    source $HOME/.config/base16-shell/profile_helper.fish

    if test $TERM_PROGRAM = 'iTerm.app'
        source $HOME/.iterm2_shell_integration.fish
    end
end

rbenv init - fish | source

direnv hook fish | source

for path in $HOME/.config/fish/config.d/*.fish
    source $path
end

function set_terminal_color --on-event fish_prompt
    if test (background status) = light
        base16-default-light
    else
        base16-default-dark
    end
end

alias grep='grep --color=auto'
alias hub='git'
alias ls='exa'
alias ll='ls -l'
alias la='ll -a'
