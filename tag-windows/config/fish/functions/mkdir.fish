function mkdir -d "mkdir with subdirectories, prompt to cd after creating"
    command mkdir -p $argv

    if test $status = 0; and status is-interactive
        set -l target $argv[-1]

        switch $target
            case '-*'

            case '*'
                if test -d $target
                    set -l response (read -n 1 -P (set_color green)"cd $target? (y/"(set_color -o brgreen)"N"(set_color normal)(set_color green)"): "(set_color normal))

                    if test "$response" = "y"
                        cd $target
                        return
                    end
                end
        end
    end
end

