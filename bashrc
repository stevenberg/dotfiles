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

paths=("$HOME/.cargo/bin" "$HOME/.composer/vendor/bin" "$GOPATH/bin" "$HOME/bin")

for path in "${paths[@]}"; do
    if [ -d "$path" ]; then
        PATH=$path:$PATH
    fi
done

if [[ $- == *i* ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.config/iterm2/shell_integration.bash"
    eval "$("$HOME"/.config/base16-shell//profile_helper.sh)"

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

    if [ -f /usr/local/etc/profile.d/autojump.sh ]; then
        source /usr/local/etc/profile.d/autojump.sh
    fi
fi

if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init -)"
fi

if [ -x "$(command -v direnv)" ]; then
    eval "$(direnv hook bash)"
fi

for config in "$HOME"/.config/bash/*.bash; do
    # shellcheck source=/dev/null
    source "$config"
done
