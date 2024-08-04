function phpstan --description 'Run PHPStan with default options'
    if test (count $argv) -gt 0
        command phpstan $argv
    else
        command phpstan --memory-limit=256M -v
    end
end
