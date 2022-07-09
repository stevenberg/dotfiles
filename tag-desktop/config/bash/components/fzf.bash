if command -v >/dev/null 2>&1 fzf; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
fi
