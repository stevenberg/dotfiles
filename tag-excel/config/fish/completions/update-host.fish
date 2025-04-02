set -l hosts (list-hosts)
complete -c update-host -f
complete -c update-host -n "not __fish_seen_subcommand_from $hosts" -a "$hosts"
complete -c update-host -s h -l help
complete -c update-host -s a -l address -x
complete -c update-host -l cifs-source -x
complete -c update-host -l cifs-path -x
complete -c update-host -l cifs-username -x
complete -c update-host -l cifs-password -x
complete -c update-host -l remove-cifs -x
complete -c update-host -s p -l php-versions -x -a '8.1 8.2 8.3 8.4'
complete -c update-host -s c -l catchall-domain -x
complete -c update-host -l remove-catchall-domain
complete -c update-host -s q -l sql-server
complete -c update-host -l remove-sql-server
