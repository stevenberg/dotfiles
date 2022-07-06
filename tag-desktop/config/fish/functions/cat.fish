function cat -d "Use bat instead of cat, or mdless for Markdown"
    set -l extensions md markdown txt

    if not test -f $argv
        echo "File not found: $argv"
        return 0
    end

    if contains (get_extension $argv) $extensions; and type -q mdless
        mdless $argv
    else
        if type -q bat
            command bat --style plain --theme base16 $argv
        else if type -q batcat
            command batcat --style plain --theme base16 $argv
        else
            command cat $argv
        end
    end
end

