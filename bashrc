shopt -s autocd
shopt -s checkhash
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s histverify
shopt -s lithist

HISTCONTROL='ignoreboth'
HISTSIZE=-1
PS1='\u@\h \w \$ '

export EDITOR='vi'
export LC_ALL='en_US.UTF-8'
export LESS='-F -g -i -r -w -X -z-3'
export VISUAL=$EDITOR

BASE16_SHELL=$HOME/.config/base16-shell/
if [ -n "$PS1" ] && [ -s "$BASE16_SHELL"/profile_helper.sh ]; then
    eval "$("$BASE16_SHELL"/profile_helper.sh)"
fi

# shellcheck source=/dev/null
source "$HOME/.config/iterm2/shell_integration.bash"

if [ -d /usr/local/share/chruby ]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
fi

if [ -x "$(command -v direnv)" ]; then
    eval "$(direnv hook bash)"
fi

if [ -x "$(command -v thefuck)" ]; then
    eval "$(SHELL=bash thefuck --alias)"
fi

if [ -x "$(command -v brew)" ]; then
    if brew command command-not-found-init >/dev/null 2>&1; then
        eval "$(brew command-not-found-init)"
    fi
fi

if [ -x "$(command -v lesspipe)" ]; then
    eval "$(lesspipe)"
elif [ -x "$(command -v lespipe.sh)" ]; then
    eval "$(lesspipe.sh)"
fi

paths=("$HOME/bin" "$GOPATH/bin" "$HOME/.composer/vendor/bin" "$HOME/.cargo/bin")

for path in "${paths[@]}"; do
    if [ -d "$path" ]; then
        PATH=$path:$PATH
    fi
done

for config in "$HOME"/.config/bash/*.bash; do
    # shellcheck source=/dev/null
    source "$config"
done
