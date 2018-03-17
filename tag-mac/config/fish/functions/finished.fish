function finished
    set message $argv[1]
    set project (basename $PWD)
    set title "Finished in $project"
    terminal-notifier -title $title -message "$message" -activate com.googlecode.iterm2
end
