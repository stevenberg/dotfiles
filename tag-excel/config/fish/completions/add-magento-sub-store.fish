function __serverconfig_add_magento_sub_store_sites
    list-sites magento
end
complete -c add-magento-sub-store -f
complete -c add-magento-sub-store -n "not __fish_seen_subcommand_from (__serverconfig_add_magento_sub_store_sites)" -a "(__serverconfig_add_magento_sub_store_sites)"
complete -c add-magento-sub-store -s h -l help
complete -c add-magento-sub-store -s d -l domain -x
complete -c add-magento-sub-store -s c -l code -x
