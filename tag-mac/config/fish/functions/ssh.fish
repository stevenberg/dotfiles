function ssh
    command ssh $argv
    if test -e ~/.base16_theme
        eval sh '"'(realpath ~/.base16_theme)'"'
    end
end

