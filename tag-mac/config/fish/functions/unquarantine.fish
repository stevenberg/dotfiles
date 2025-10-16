function unquarantine --description 'Remove the quarantine attribute from a file'
    xattr -dr com.apple.quarantine $argv
end
