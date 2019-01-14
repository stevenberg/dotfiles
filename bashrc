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

export EDITOR='vim'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export GREP_OPTIONS='--color=auto'
export LC_ALL='en_US.UTF-8'
export LESS='-F -g -i -r -w -X -z-3'
export LESS_ADVANCED_PREPROCESSOR=1
export RUBY_CONFIGURE_OPTS='--with-jemalloc'
export VISUAL=$EDITOR

if [[ $- == *i* ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.config/iterm2/shell_integration.bash"
    eval "$("$HOME"/.config/base16-shell/profile_helper.sh)"

    if [ -x "$(command -v lesspipe)" ]; then
        eval "$(lesspipe)"
    elif [ -x "$(command -v lespipe.sh)" ]; then
        eval "$(lesspipe.sh)"
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
