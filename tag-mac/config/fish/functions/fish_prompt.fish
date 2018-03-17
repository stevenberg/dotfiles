function fish_prompt
    set last_status $status
    if test $last_status -eq 0
        set status_color green
    else
        set status_color red
    end

    echo -n -s \
        (set_color $status_color) $last_status ' ' \
        (set_color blue) (prompt_pwd) \
        (set_color green) (vcprompt -f ' %b') \
        (set_color red) (vcprompt -f '%u%m') ' '
    if test $USER = 'root'
        set_color red
        echo -n '# '
    else
        set_color normal
        echo -n '> '
    end
end
