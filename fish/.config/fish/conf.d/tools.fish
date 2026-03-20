# ╔═══════════════════════════════════════════════════════╗
# ║                     tools.fish                        ║
# ║         External tool integrations & inits            ║
# ╚═══════════════════════════════════════════════════════╝

# ── thefuck ──────────────────────────────────────────────
if command -v thefuck >/dev/null
    thefuck --alias | source
end

# ── Starship prompt ──────────────────────────────────────
if command -v starship >/dev/null
    starship init fish | source
end

# ── skim (sk) ────────────────────────────────────────────
if command -v sk >/dev/null
    sk --shell fish | source
end

# ── Atuin (shell history) ────────────────────────────────
# Uncomment to enable:
# if command -v atuin >/dev/null
#     atuin init fish | source
# end

# ── OrbStack ─────────────────────────────────────────────
if test -f ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish 2>/dev/null
end
