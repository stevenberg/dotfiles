for component in "${COMPONENTS[@]}"; do
    # shellcheck source=/dev/null
    source "$HOME/.config/bash/components/$component.bash"
done
