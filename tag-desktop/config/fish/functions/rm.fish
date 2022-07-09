function rm --description 'rm with forbidden -f'
    if contains -- -f $argv; or contains -- -rf $argv
        echo 'Better not.'
    else
        command rm $argv
    end
end
