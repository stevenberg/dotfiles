function fallback --description 'allow a fallback value for a variable'
    if test (count $argv) = 1
        echo $argv
    else
        echo $argv[1..-2]
    end
end

