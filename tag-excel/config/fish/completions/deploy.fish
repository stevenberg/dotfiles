set -l sites (ls ./sites/)
complete -c deploy -f
complete -c deploy -n "not __fish_seen_subcommand_from $sites" -a "$sites"
complete -c deploy -s h -l help
complete -c deploy -s d -l debug
complete -c deploy -s m -l mode -x -a 'app web full'
