function fish_title
    if test -n "$FISH_TITLE"
        echo $FISH_TITLE '- '
    end
    echo $_
end
