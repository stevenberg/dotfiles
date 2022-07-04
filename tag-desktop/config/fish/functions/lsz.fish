function lsz -d 'List the contents of any kind of archive'
    if  test (count $argv) -eq 0
        echo "lsz filename.[tar,tgz,gz,zip,etc]"
        return 1
    end

    set -l retval 0
    set -l files

    for file in $argv
        if test -f "$file"
            switch "$file"
                case '*.tar.bz2' '*.tar.gz' '*.tbz2' '*.tgz' '*.zip'
                    set files $files "$file"

                case '*'
                    echo "lsz: $file: Not an archive"
                    set retval 1
            end
        else
            echo "lsz: $file: No such file"
            set retval 1
        end
    end

    set -l n (count $files)

    for file in $files
        switch "$file"
            case '*.tar.bz2' '*.tar.gz' '*.tbz2' '*.tgz'
                if test $n -gt 1
                    echo "$file:"
                end
                tar tvf "$file"

            case '*.zip'
                unzip -l "$file"
        end
        if test $n -gt 1
            echo
        end
    end

    return $retval
end
