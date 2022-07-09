if command -v >/dev/null 2>&1 direnv; then
    eval "$(direnv hook bash)"
fi
