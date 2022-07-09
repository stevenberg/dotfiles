if command -v >/dev/null 2>&1 rbenv; then
    export RUBY_CONFIGURE_OPTS='--with-jemalloc'
    eval "$(rbenv init - bash)"
fi
