function nvim
    if test -n "$NVIM_LISTEN_ADDRESS"
        nvr $argv
    else
        command nvim $argv
    end
end
