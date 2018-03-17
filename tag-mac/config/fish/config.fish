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

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
source (direnv hook fish|psub)
source $HOME/.config/iterm2/shell_integration.fish
thefuck --alias | source
brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)

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
