set -l types magento mysql web
complete -c add-host -f
complete -c add-host -n "not __fish_seen_subcommand_from $types" -a "$types"
complete -c add-host -s h -l help
complete -c add-host -s a -l address -x
complete -c add-host -s i -l internal
complete -c add-host -s s -l staging
complete -c update-host -l cifs-source -x
complete -c update-host -l cifs-path -x
complete -c update-host -l cifs-username -x
complete -c update-host -l cifs-password -x
complete -c add-host -s p -l php-versions -x -a '8.1 8.2 8.3 8.4'
complete -c add-host -s c -l catchall-domain -x
complete -c add-host -s q -l sql-server
