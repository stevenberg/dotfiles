function rm() {
    if [[ "$*" =~ '-f' ]] || [[ "$*" =~ '-rf' ]]; then
        echo 'Better not.'
    else
        command rm "$@"
    fi
}
