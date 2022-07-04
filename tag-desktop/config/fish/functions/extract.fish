function extract -d "Extract any kind of archive"
    if [ (count $argv) -ne 1 ]
        echo "Error: No file specificed" >&2
        return 1
    else
        set file $argv[1]
        if [ -f $file ]
            switch $file
                case '*.tar.bz2' '*.tbz2'
                    tar xjf $file
                case '*.tar.gz' '*.tgz'
                    tar xzf $file
                case '*.bz2'
                    bunzip2 $file
                case '*.rar'
                    unrar x $file
                case '*.gz'
                    gunzip $file
                case '*.tar'
                    tar xf $file
                case '*.zip'
                    unzip $file
                case '*.Z'
                    uncompress $file
                case '*.7z'
                    7z x $file
                case '*'
                    echo "'$file' cannot be extracted via extract"
            end
        else
            echo "'$file' is not a valid file"
        end
    end
end
