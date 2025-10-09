function wifi-ssid -d 'Print the SSID of the current wifi network'
    wifi-interface | xargs ipconfig getsummary | rg ' SSID' | cut -d : -f 2 | trim
end
