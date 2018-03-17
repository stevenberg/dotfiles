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

# shellcheck source=/dev/null
source "$HOME/.config/iterm2/shell_integration.bash"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
eval "$(direnv hook bash)"
eval "$(SHELL=bash thefuck --alias)"
if brew command command-not-found-init >/dev/null 2>&1; then
    eval "$(brew command-not-found-init)"
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
