function laravel-logs
    tail -f -n 450 storage/logs/*.log | \
        rg -i "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}\]|Next [\w]+?:"
end
