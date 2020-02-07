function clip
    if file -I $argv[1] | grep -q '(text|json)'
        command cat "$argv" | pbcopy
    else
        echo "File \"$argv[1]\" is not plaintext." >&2
        return 1
    end
end
