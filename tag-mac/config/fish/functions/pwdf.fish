function pwdf -d 'echo the currently open folder in Finder'
    set path (osascript -e '
        tell application "Finder"
            try
                set thepath to (folder of the front window as alias)
            on error
                set thepath to (path to desktop folder as alias)
            end try
            POSIX path of thepath
        end tell
    ')

    echo "$path"
end
