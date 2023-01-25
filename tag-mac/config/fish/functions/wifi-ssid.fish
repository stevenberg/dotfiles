function wifi-ssid -d 'Print the SSID of the current wifi network'
    wifi-interface | xargs networksetup -getairportnetwork | sed 's/Current Wi-Fi Network: //'
end
