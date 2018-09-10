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

set PATH \
    /usr/local/opt/python/libexec/bin \
    /usr/local/go/bin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    /usr/local/sbin \
    /usr/sbin \
    /sbin

set extra_paths \
    $HOME/Library/Python/3.7/bin \
    $HOME/.cargo/bin \
    $HOME/.composer/vendor/bin \
    $GOPATH/bin \
    $HOME/.rbenv/bin \
    $HOME/bin

for extra_path in $extra_paths
    if test -d "$extra_path"
        set PATH $extra_path $PATH
    end
end

if status --is-interactive
    source $HOME/.config/iterm2/shell_integration.fish
    source $HOME/.config/base16-shell/profile_helper.fish

    if type -q brew
        brew command command-not-found-init > /dev/null ^&1; and source (brew command-not-found-init)
    end

    if type -q thefuck
        thefuck --alias | source
    end

    if test -f /usr/local/share/autojump/autojump.fish
        source /usr/local/share/autojump/autojump.fish
    end
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
