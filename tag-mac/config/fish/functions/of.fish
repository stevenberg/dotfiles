function of --description 'open a directory in Finder'
    open -F (fallback $argv ".")
end

