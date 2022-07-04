function set_terminal_color --on-event fish_prompt
    if test (background status) = light
        base16-default-light
    else
        base16-default-dark
    end
end
