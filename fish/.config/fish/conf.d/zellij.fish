# ╔═══════════════════════════════════════════════════════╗
# ║                    zellij.fish                        ║
# ║           Zellij auto-start / auto-exit               ║
# ╚═══════════════════════════════════════════════════════╝
# To enable auto-attach or auto-exit, set these vars before
# sourcing this file (e.g. in secret.fish or env.fish):
#
#   set -gx ZELLIJ_AUTO_ATTACH true
#   set -gx ZELLIJ_AUTO_EXIT   true

if not set -q ZELLIJ
    if test "$ZELLIJ_AUTO_ATTACH" = true
        zellij attach -c
    else
        zellij
    end

    if test "$ZELLIJ_AUTO_EXIT" = true
        kill $fish_pid
    end
end
