if [[ $- == *i* ]]; then
    BASE16_SHELL_PATH="$HOME/.config/base16-shell"

    if [ -f "$BASE16_SHELL_PATH/profile_helper.sh" ]; then
        # shellcheck source=/dev/null
        source "$BASE16_SHELL_PATH/profile_helper.sh"

        function precommand() {
            if command -v >/dev/null 2>&1 spwd; then
                    echo -ne "\033]0; $(spwd) \007"
            fi
            eval "base16_$(colorscheme)"
        }

        if command -v >/dev/null 2>&1 starship; then
            export starship_precmd_user_func='precommand'
        else
            export PROMPT_COMMAND='precommand'
        fi
    fi
fi
