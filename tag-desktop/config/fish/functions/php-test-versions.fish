function php-test-versions --description 'Run PHPUnit tests for multiple PHP versions'
    for v in (string split ' ' $PHP_VERSIONS)
        if string match --quiet --regex '^\d+\.\d+$' $v
            set v (asdf latest php $v)
        end
        echo "*** $v ***"
        asdf shell php $v
        trash vendor composer.lock
        composer install --quiet
        phpunit
        echo
    end
    trash vendor composer.lock
    asdf shell php --unset
    composer install --quiet
end
