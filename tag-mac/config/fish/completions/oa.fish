complete -c oa -x -a (basename -s .app /Applications/*.app | awk '{ printf "\"%s\" ", $0}')
