# ╔═══════════════════════════════════════════════════════╗
# ║                    python.fish                        ║
# ║           Python, uv, and venv helpers                ║
# ╚═══════════════════════════════════════════════════════╝

# ── Virtual environment ──────────────────────────────────
if command -v uv >/dev/null
    abbr --add vc uv venv
else
    alias vc="python3 -m venv .venv"
end

alias va="source .venv/bin/activate.fish"
alias vr="rm -rf .venv"
alias vd="deactivate"

# ── uv ───────────────────────────────────────────────────
abbr --add upu uv python upgrade
abbr --add usu uv self update
