function vpn
    set -l wg_config "$HOME/VPN/szh_mac.conf"
    set -l sb_config "$HOME/VPN/sing-box/config.json"
    set -l sb_pid "/tmp/$USER-sing-box-vpn.pid"
    set -l sb_log "$HOME/VPN/sing-box/sing-box.log"

    if test (count $argv) -lt 1
        echo "Usage:"
        echo "  vpn on"
        echo "  vpn on bilibili"
        echo "  vpn off"
        return 1
    end

    switch $argv[1]
        case on
            # -------------------------
            # vpn on
            # Original full-tunnel VPN
            # -------------------------
            if test (count $argv) -eq 1
                # Don't allow both modes at once.
                if test -f $sb_pid
                    set -l pid (cat $sb_pid)

                    if sudo kill -0 $pid 2>/dev/null
                        echo "Bilibili VPN mode is already running."
                        echo "Run 'vpn off' first."
                        return 1
                    end
                end

                sudo wg-quick up $wg_config
                return $status
            end

            switch $argv[2]
                case bilibili
                    # -------------------------
                    # vpn on bilibili
                    # sing-box split tunneling
                    # -------------------------

                    if test -f $sb_pid
                        set -l pid (cat $sb_pid)

                        if sudo kill -0 $pid 2>/dev/null
                            echo "Bilibili VPN mode is already running."
                            return 0
                        else
                            sudo rm -f $sb_pid
                        end
                    end

                    # Validate sing-box config first.
                    sudo sing-box check -c $sb_config
                    or return $status

                    # Make sudo ask for the password now, before we background it.
                    sudo -v
                    or return $status

                    # Start a root shell, record its PID, then replace that
                    # shell with sing-box. Therefore the PID remains the PID
                    # of the actual sing-box process.
                    sudo sh -c \
                        "echo \$\$ > '$sb_pid'; exec sing-box run -c '$sb_config' >> '$sb_log' 2>&1" &

                    # Give it a moment to initialize.
                    sleep 1

                    if test -f $sb_pid
                        set -l pid (cat $sb_pid)

                        if sudo kill -0 $pid 2>/dev/null
                            echo "Bilibili VPN enabled."
                            echo "Log: $sb_log"
                            return 0
                        end
                    end

                    echo "Failed to start sing-box."
                    echo "Check: $sb_log"
                    return 1

                case '*'
                    echo "Unknown VPN mode: $argv[2]"
                    echo "Usage:"
                    echo "  vpn on"
                    echo "  vpn on bilibili"
                    echo "  vpn off"
                    return 1
            end

        case off
            # -------------------------
            # First try sing-box mode.
            # -------------------------
            if test -f $sb_pid
                set -l pid (cat $sb_pid)

                if sudo kill -0 $pid 2>/dev/null
                    sudo kill $pid
                    set -l kill_status $status

                    if test $kill_status -eq 0
                        sudo rm -f $sb_pid
                        echo "Bilibili VPN disabled."
                        return 0
                    end
                else
                    sudo rm -f $sb_pid
                end
            end

            # -------------------------
            # Otherwise use original
            # wg-quick shutdown.
            # -------------------------
            sudo wg-quick down $wg_config
            return $status

        case '*'
            echo "Usage:"
            echo "  vpn on"
            echo "  vpn on bilibili"
            echo "  vpn off"
            return 1
    end
end
