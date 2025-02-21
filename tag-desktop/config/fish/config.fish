set -x EDITOR vim
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR

umask 022

set fish_greeting

if test (uname -s) = Darwin
    set HOMEBREW_PREFIX /opt/homebrew
else
    set HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
end

if test -x $HOMEBREW_PREFIX/bin/brew
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
end

if type -q lesspipe
    set -x LESSOPEN '| lesspipe %s'
    set -x LESSCLOSE 'lesspipe %s %s'
end
if type -q lesspipe.sh
    set -x LESSOPEN '| lesspipe.sh %s'
end

set -x CDPATH .
for path in $HOME/Developer/Projects $HOME/Developer/Excel/Projects
    if test -d $path
        set -x CDPATH $CDPATH $path
    end
end

for path in $HOME/bin $HOME/.cargo/bin $HOMEBREW_PREFIX/opt/python/libexec $HOME/.composer/vendor/bin
    if test -d $path
        fish_add_path -m $path
    end
end

if test -d $HOMEBREW_PREFIX/opt/go/libexec; and test -d $HOME/Developer/Go
    set -x GOPATH $HOME/Developer/Go
    set -x GOROOT $HOMEBREW_PREFIX/opt/go/libexec
    fish_add_path -m $HOME/Developer/Go/bin
end

if type -q open
    set -x BROWSER open
end

if type -q fzf
    set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
end

if type -q asdf
    set -gx --prepend PATH $HOME/.asdf/shims
    set -l php_version (asdf current php | tail -1 | tr -s ' ' | cut -d ' ' -f 2)
    set -l composer_bin_path $HOME/.asdf/installs/php/$php_version/.composer/vendor/bin
    if test -d $composer_bin_path
        fish_add_path $composer_bin_path
    end
end

if type -q direnv
    direnv hook fish | source
end

if test -e $HOME/.config/op/plugins.sh
    source $HOME/.config/op/plugins.sh
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end

    if type -q ngrok
        ngrok completion | source
    end

    if type -q laravel
        laravel completion | source
    end

    if test "$TERM_PROGRAM" = 'iTerm.app'
        source $HOME/.iterm2_shell_integration.fish
    end

    set BASE16_SHELL_PATH $HOME/.config/base16-shell
    source $BASE16_SHELL_PATH/profile_helper.fish

    function set_terminal_color --on-event fish_prompt
        set fn base16-(colorscheme)
        eval $fn
        set -x BASE16_THEME $BASE16_THEME
    end
end

alias grep='grep --color=auto'
if type -q bat
    alias bat='bat --theme base16'
end
if type -q eza
    alias ls='eza'
end
alias ll='ls -lh'
alias la='ll -a'
