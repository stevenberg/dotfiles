set -x BROWSER 'open'
set -x CDPATH . "$HOME/dev/repos"
set -x EDITOR 'vim'
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
set -x GOPATH "$HOME/go"
set -x GOROOT "/usr/local/go"
set -x GREP_OPTIONS '--color=auto'
set -x LC_ALL 'en_US.UTF-8'
set -x LESS '-F -g -i -R -w -X -z-3'
set -x LESSOPEN '|lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
set -x VISUAL $EDITOR

umask 022

abbr -a ax chmod a+x
abbr -a lr ls -R

set fish_greeting

source $HOME/.config/iterm2/shell_integration.fish

if status --is-interactive
    source $HOME/.config/base16-shell/profile_helper.fish
end

source $HOME/.config/iterm2/shell_integration.fish

if test -d /usr/local/share/chruby
    source /usr/local/share/chruby/chruby.fish
    source /usr/local/share/chruby/auto.fish
end

if type -q direnv
    source (direnv hook fish|psub)
end

if type -q thefuck
    thefuck --alias | source
end

if type -q brew
    brew command command-not-found-init > /dev/null ^&1; and source (brew command-not-found-init)
end

set extra_paths \
    $HOME/bin \
    $GOPATH/bin \
    $HOME/.composer/vendor/bin \
    $HOME/.cargo/bin

for extra_path in $extra_paths
    if test -d "$extra_path"
        set PATH $extra_path $PATH
    end
end

for path in $HOME/.config/fish/config.d/*.fish
    source $path
end
