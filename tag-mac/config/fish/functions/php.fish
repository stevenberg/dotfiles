function php --description 'Run the php command for the version specified in $PHP_VERSION'
    if set -q PHP_VERSION
        and test -n "$PHP_VERSION" -a -x /usr/local/opt/php@"$PHP_VERSION"/bin/php
        /usr/local/opt/php@"$PHP_VERSION"/bin/php $argv
    else
        command php $argv
    end
end

