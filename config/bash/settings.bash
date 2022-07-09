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

export EDITOR='vim'
export LC_ALL='en_US.UTF-8'
export LESS='-F -g -i -r -w -X -z-3'
export LESS_ADVANCED_PREPROCESSOR=1
export VISUAL=$EDITOR
