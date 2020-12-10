function code -d 'Open a path in Visual Studio Code'
    set -l path
    if test (count $argv) = 0
        set path '.'
    else
        set path "$argv"
    end
    open "$path" -b com.microsoft.VSCode
end
