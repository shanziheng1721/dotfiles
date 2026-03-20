# ╔═══════════════════════════════════════════════════════╗
# ║                    config.fish                        ║
# ║          Entry point — sources all modules            ║
# ╚═══════════════════════════════════════════════════════╝

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -l fish_config_dir ~/.config/fish

# ── Core ────────────────────────────────────────────────
source $fish_config_dir/conf.d/homebrew.fish
source $fish_config_dir/conf.d/env.fish

# ── Aliases & Abbreviations ──────────────────────────────
source $fish_config_dir/conf.d/aliases.fish
source $fish_config_dir/conf.d/rust.fish
source $fish_config_dir/conf.d/python.fish
source $fish_config_dir/conf.d/perlbrew.fish

# ── Tool Integrations ────────────────────────────────────
source $fish_config_dir/conf.d/tools.fish
source $fish_config_dir/conf.d/zellij.fish

# ── Secret / Machine-local (not in git) ──────────────────
if test -f $fish_config_dir/conf.d/secret.fish
    source $fish_config_dir/conf.d/secret.fish
end
