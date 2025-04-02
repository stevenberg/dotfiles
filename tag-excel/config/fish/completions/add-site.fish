set -l types magento
set -l hosts (list-hosts web)
complete -c add-site -f
complete -c add-site -n "not __fish_seen_subcommand_from $types" -a "$types"
complete -c add-site -s h -l help
complete -c add-site -s o -l host -x -a "$hosts"
complete -c add-site -s d -l domain -x
complete -c add-site -s a -l auth-realm -x
complete -c add-site -s u -l auth-username -x
complete -c add-site -s p -l auth-password -x
complete -c add-site -s e -l auth-external
complete -c add-site -s m -l auth-matcher -x
complete -c add-site -n '__fish_seen_subcommand_from magento' -s g -l paid-google-cards
complete -c add-site -n '__fish_seen_subcommand_from magento' -s c -l contact-address -x
