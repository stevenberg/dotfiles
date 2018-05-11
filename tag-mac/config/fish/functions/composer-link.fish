function composer-link
    composer config repositories.local '{"type": "path", "url": "'$argv[1]'"}' --file composer.json
end
