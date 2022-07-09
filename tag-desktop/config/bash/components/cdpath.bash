CDPATH=.
for path in "${ADD_CDPATHS[@]}"; do
    if [ -d "$path" ]; then
        CDPATH="$CDPATH:$path"
    fi
done
export CDPATH
