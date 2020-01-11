use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell Application "Safari"
    set _window_count to count windows
    set _tab_count to 0

    repeat with _w in every window
        set _tab_count to _tab_count + (count of tabs of _w)
    end repeat

    set _msg to _window_count & " windows containing " & _tab_count & " tabs." as string

    display alert "Are you sure you want to quit Safari?" message _msg buttons {"Cancel", "Quit"} giving up after 60

    if button returned of result is "Quit" then quit
end tell
