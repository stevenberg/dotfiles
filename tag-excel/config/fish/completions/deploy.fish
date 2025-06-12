function __serverconfig_deploy_sites
    ls ./sites/
end
complete -c deploy -f
complete -c deploy -n "not __fish_seen_subcommand_from (__serverconfig_deploy_sites)" -a "(__serverconfig_deploy_sites)"
complete -c deploy -s h -l help
complete -c deploy -s d -l debug
complete -c deploy -s r -l dry-run
complete -c deploy -s m -l mode -x -a 'app web full modules'
