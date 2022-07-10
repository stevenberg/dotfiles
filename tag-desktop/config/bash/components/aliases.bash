alias grep='grep --color=auto'
if command -v >/dev/null 2>&1 bat; then
    alias bat='bat --theme base16'
fi
if command -v >/dev/null 2>&1 exa; then
    alias ls='exa'
fi
alias ll='ls -lh'
alias la='ll -a'
