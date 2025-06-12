set -l types custom laravel magento
set -l accpac_databases eelinc midinc mmlinc nuvinc slyinc ttninc wwwsbx
function __serverconfig_add_site_hosts
    list-hosts web
end
complete -c add-site -f
complete -c add-site -n "not __fish_seen_subcommand_from $types" -a "$types"
complete -c add-site -s h -l help
complete -c add-site -s o -l host -x -a "(__serverconfig_add_site_hosts)"
complete -c add-site -s d -l domain -x
complete -c add-site -s a -l auth-realm -x
complete -c add-site -s u -l auth-username -x
complete -c add-site -s p -l auth-password -x
complete -c add-site -s e -l auth-external
complete -c add-site -s m -l auth-matcher -x
complete -c add-site -l allow -x
complete -c add-site -l deny -x
complete -c add-site -s v -l php-version -x -a '7.4 8.1 8.2 8.3 8.4'
complete -c add-site -n '__fish_seen_subcommand_from custom' -l git -x
complete -c add-site -n '__fish_seen_subcommand_from custom' -l mysql
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l git -x
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l app-name -x
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l mail-from-address -x
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l mail-from-name -x
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l ldap-auth
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l broadcast
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l accpac
complete -c add-site -n '__fish_seen_subcommand_from laravel' -l accpac-default -x -a "$accpac_databases"
complete -c add-site -n '__fish_seen_subcommand_from magento' -s g -l paid-google-cards
complete -c add-site -n '__fish_seen_subcommand_from magento' -s c -l contact-address -x
