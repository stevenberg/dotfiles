if [[ $- == *i* ]]; then
    if command -v >/dev/null 2>&1 starship; then
        eval "$(starship init bash)"
    fi
fi
