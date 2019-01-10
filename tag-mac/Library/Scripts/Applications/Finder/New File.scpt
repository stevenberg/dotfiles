tell application "Finder"
    try
        set _result to display dialog "Filename:" with icon note default answer "" buttons {"Cancel", "Create"} default button "Create"
        if button returned of _result is "Cancel" then
            return
        end
        if length of text returned of _result is 0 then
            return
        end
        set _filename to the text returned of _result
        set _current_folder to the target of the front window as alias
        make new file at _current_folder with properties {name: _filename, file type: "TEXT"}
    on error _error
        if _error is equal to "Finder got an error: User canceled."
            return
        else
            display dialog (_error)
        end
    end try
end tell
