for path in "${ADD_PATHS[@]}"; do
    if [ -d "$path" ]; then
        PATH=$path:$PATH
    fi
done
