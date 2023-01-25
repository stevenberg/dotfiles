function wifi-interface -d 'Print the wifi network interface'
    networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}'
end
