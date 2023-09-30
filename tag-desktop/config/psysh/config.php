<?php

if (is_file(getcwd() . '/vendor/autoload.php')) {
    require_once getcwd() . '/vendor/autoload.php';
}

if (is_file(getcwd() . '/.user.ini')) {
    $config = parse_ini_file(getcwd() . '/.user.ini');
    foreach ($config as $key => $value) {
        ini_set($key, $value);
    }
}

if (is_file(getcwd() . '/.env')) {
    Dotenv\Dotenv::createImmutable(getcwd(), '.env')->load();
}

return [
    'eraseDuplicates' => true,
    'useBracketedPaste' => true,
    'warnOnMultipleConfigs' => true,
    'usePcntl' => false,
];
