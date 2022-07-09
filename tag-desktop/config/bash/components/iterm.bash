if [[ $- == *i* ]]; then
    if [ "$TERM_PROGRAM" = 'iTerm.app' ]; then
        # shellcheck source=/dev/null
        source "$HOME"/.iterm2_shell_integration.bash
    fi
fi
