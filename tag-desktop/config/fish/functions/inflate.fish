function inflate
    ruby -r zlib -e "STDOUT.write(Zlib::Inflate.inflate(STDIN.read))"
end

