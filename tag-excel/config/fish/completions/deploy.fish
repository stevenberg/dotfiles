set -l sites (ls ./sites/)
complete -c deploy -f
complete -c deploy -n "not __fish_seen_subcommand_from $sites" -a "$sites"
