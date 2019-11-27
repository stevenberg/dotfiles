function gt -d "Jump to top level of git repo"
    cd (git rev-parse --show-toplevel)
end
