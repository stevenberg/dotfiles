set -l groups (rg -N '^\[' ./inventory | tr -d '[]')

complete -c add-host -f
complete -c add-host -s h -l help
complete -c add-host -s o -l host -x
complete -c add-host -s g -l group -x -a "$groups"
complete -c add-host -s i -l interface -x
complete -c add-host -s a -l address -x
complete -c add-host -s r -l root -x
complete -c add-host -s b -l boot -x
