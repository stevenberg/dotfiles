tell application "Safari"
	tell front window
		set _old_tab to current tab
		set _new_tab to make new tab at after _old_tab
		set current tab to _new_tab
	end tell
end tell
tell application "System Events"
    tell process "Safari"
        tell menu bar 1
            tell menu bar item "Bookmarks"
                tell menu "Bookmarks"
                    click menu item "Show Start Page"
                end tell
            end tell
        end tell
    end tell
end tell
