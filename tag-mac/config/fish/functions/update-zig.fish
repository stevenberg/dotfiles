function update-zig --description 'Update Zig'
    set -l public_signing_key 'RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U'

    set -l cache_directory ~/.cache/update-zig
    set -l mirrors_file $cache_directory/community-mirrors.txt
    set -l update_mirrors_file 0

    # If $mirrors_file doesn't exist or is older than 24 hours, update it.
    if not test -e $mirrors_file
        set update_mirrors_file 1
    else
        set -l now (date +'%s')
        set -l mtime (stat -f '%m' $mirrors_file)
        if test (math $now - $mtime) -gt 86400
            set update_mirrors_file 1
        end
    end
    if test $update_mirrors_file -eq 1
        echo "Caching mirror list..."
        command mkdir -p $cache_directory
        curl -s --output-dir $cache_directory -O https://ziglang.org/download/community-mirrors.txt
        if not test -e $mirrors_file
            echo "Failed to cache mirror list!"
            return 1
        end
    end

    # Try each mirror until one works.
    for mirror_url in (sort -R $mirrors_file) https://ziglang.org/download/
        echo "Trying mirror $mirror_url..."

        set -l zig_index (curl -s $mirror_url/index.json)

        if not echo $zig_index | jq >/dev/null 2>&1 .
            echo "Mirror returned invalid JSON!"
            continue
        end

        set -l zig_version (echo $zig_index | jq -r '.["master"]["version"]')

        if test ! -n "$zig_version"
            echo "Can't find current version!"
            continue
        end

        # Zig is installed and up to date.
        if type -q zig; and test $zig_version = (zig version)
            echo "Installed version $zig_version is up to date."
            break
        end

        echo "Updating to version $zig_version..."

        set -l download_url (echo $zig_index | jq -r '.["master"]["aarch64-macos"]["tarball"]')
        set -l download_file ~/Downloads/(basename $download_url)
        set -l install_directory ~/Developer/Zig

        # Download the tarball and verify its signature.
        curl -s --output-dir ~/Downloads -O $download_url
        curl -s --output-dir ~/Downloads -O $download_url.minisig
        if not minisign -q -V -m $download_file -P $public_signing_key
            echo "Signature verification failed!"
            continue
        end

        # Delete the installed version.
        if test -d $install_directory
            trash $install_directory
        end

        # Install the new version.
        command mkdir $install_directory
        tar -x -C $install_directory --strip-components 1 -f $download_file
        unquarantine $install_directory/zig

        # Delete the download files.
        trash $download_file
        trash $download_file.minisig

        echo "Done."
        break
    end
end
