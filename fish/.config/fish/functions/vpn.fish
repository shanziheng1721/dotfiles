function vpn --argument-names action
    set -l conf ~/VPN/szh_mac.conf
    switch $action
        case on
            sudo wg-quick up $conf
        case off
            sudo wg-quick down $conf
        case '*'
            echo "Usage: vpn {on|off}"
            return 1
    end
end
