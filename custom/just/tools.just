mount $share $local_ip="192.168.16.13" $vpn_ip="192.168.8.1" $user="liam":
    #!/bin/bash

    # determine which IP the server is available at
    ip=""
    if ping -c1 -w3 $local_ip >/dev/null 2>&1; then
        ip=$local_ip
    elif ping -c1 -w3 $vpn_ip >/dev/null 2>&1; then
        ip=$vpn_ip
    fi

    # mount the specified share
    if [[ -n $ip ]]; then
        echo "Mounting $user@//$ip/$share to /mnt/$share"
        sudo mkdir /mnt/$share
        sudo mount -t cifs -o username=$user,uid=1000,gid=1000 //$ip/$share /mnt/$share

        # make a copy of my KeePass db for offline access
        if [[ "$share" == "liam" ]]; then
            cp /mnt/liam/Passwords.kdbx ~/Passwords-LOCAL.kdbx
        fi
    else
        echo "BUSCH could not be found, try connecting to the VPN"
    fi

root-monitor-config:
    sudo install -o root -m 644 ~/.config/monitors.xml /etc/xdg/monitors.xml
