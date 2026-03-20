# ╔═══════════════════════════════════════════════════════╗
# ║                      env.fish                         ║
# ║          Environment variables and PATH               ║
# ╚═══════════════════════════════════════════════════════╝

# ── Editor ───────────────────────────────────────────────
set -gx EDITOR nvim

# ── Key bindings ─────────────────────────────────────────
set -g fish_key_bindings fish_vi_key_bindings

# ── Colours ──────────────────────────────────────────────
set -g fish_color_command green

# ── PATH additions ───────────────────────────────────────
# npm global packages
fish_add_path ~/.npm-packages/bin

# ── Tmux ─────────────────────────────────────────────────
set -gx fish_tmux_autoquit true
