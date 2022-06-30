set -l types custom laravel magento magento-sub-store redirect satis wordpress

set -l hosts (inventory-group web)

set -l magento_domains (rg '(type: magento$|"type": "magento")' sites/*/vars.{yml,json} |
    xargs dirname |
    xargs basename)

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

complete -c add-site -n "__fish_seen_subcommand_from custom laravel" \
    -s r -l repository -x

complete -c add-site -n "__fish_seen_subcommand_from custom" \
    -s t -l database

complete -c add-site -n "__fish_seen_subcommand_from laravel" \
    -s n -l laravel-name -x

complete -c add-site -n "__fish_seen_subcommand_from laravel" \
    -s l -l laravel-ldap-auth

complete -c add-site -n "__fish_seen_subcommand_from laravel" \
    -s b -l laravel-broadcast

complete -c add-site -n "__fish_seen_subcommand_from magento" \
    -s g -l magento-paid-google-cards

complete -c add-site -n "__fish_seen_subcommand_from magento" \
    -s s -l magento-staging

complete -c add-site -n "__fish_seen_subcommand_from magento-sub-store" \
    -s b -l magento-base-domain -x -a "$magento_domains"

complete -c add-site -n "__fish_seen_subcommand_from magento-sub-store" \
    -s c -l magento-code -x

complete -c add-site -n "__fish_seen_subcommand_from redirect" \
    -s c -l magento-code -x
