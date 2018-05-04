function internetdown
    while not ping -W1 -c1 1.1.1.1 >/dev/null
        sleep 5
    end

    pushnotify "Internet" "It's back!"
end
