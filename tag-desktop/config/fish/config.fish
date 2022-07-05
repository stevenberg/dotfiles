set -x EDITOR vim
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR

umask 022

set fish_greeting

if test -x /opt/homebrew/bin/brew
    set -x HOMEBREW_INSTALL_CLEANUP 1
    eval (/opt/homebrew/bin/brew shellenv)
end

set -x CDPATH .
for path in $HOME/Development/Projects $HOME/Development/Excel/Projects
    if test -d $path
        set -x CDPATH $CDPATH $path
    end
end

for path in $HOME/bin $HOME/.cargo/bin /opt/homebrew/opt/python/libexec $HOME/.composer/vendor/bin
    if test -d $path
        fish_add_path $path
    end
end

if test -d /opt/homebrew/opt/go/libexec; and test -d $HOME/Development/Go
    set -x GOPATH $HOME/Development/Go
    set -x GOROOT /opt/homebrew/opt/go/libexec
    fish_add_path $HOME/Development/Go/bin
end

if type -q open
    set -x BROWSER open
end

if type -q fzf
    set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
end

if type -q rbenv
    set -x RUBY_CONFIGURE_OPTS --with-jemalloc
    rbenv init - fish | source
end

if type -q direnv
    direnv hook fish | source
end

for path in $HOME/.config/fish/config.d/*.fish
    source $path
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if test $TERM_PROGRAM = 'iTerm.app'
        set BASE16_SHELL_PATH $HOME/.config/base16-shell
        source $BASE16_SHELL_PATH/profile_helper.fish
        source $HOME/.iterm2_shell_integration.fish
    end

    function set_terminal_color --on-event fish_prompt
        if test (background status) = light
            base16-default-light
            set -x THEME default-light
        else
            base16-default-dark
            set -x THEME default-dark
        end
    end
end

alias grep='grep --color=auto'
alias hub='git'
if type -q exa
    alias ls='exa'
end
alias ll='ls -l'
alias la='ll -a'
