function bid
    set shortname (basename $argv[1] .app)
    if test -d "/Applications/$shortname.app"
        set location "/Applications/$shortname.app"
    else
        set location (mdfind -onlyin /Applications -onlyin ~/Applications -onlyin /Developer/Applications 'kMDItemKind=Application' | awk -F '/' -v re="$shortname" 'tolower($NF) ~ re {print $0}' | head -n1)
    end
    if test -z $location
        echo "$argv[1] not found, I quit"
        return
    end
    set bundleid (mdls -name kMDItemCFBundleIdentifier -r "$location")
    if test -z $bundleid
        echo "Error getting budle ID for $argv"
    else
        echo "$location: $bundleid"
    end
end
