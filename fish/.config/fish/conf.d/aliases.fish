# ╔═══════════════════════════════════════════════════════╗
# ║                    aliases.fish                       ║
# ║        General aliases and abbreviations              ║
# ╚═══════════════════════════════════════════════════════╝

# ── Navigation: Developer directory ─────────────────────
if test -d ~/Developer
    alias dev="cd ~/Developer/"
else
    alias dev="cd ~/dev/"
end

alias dt="cd ~/Desktop/"
alias doc="cd ~/Documents/"

# ── Navigation: Books ────────────────────────────────────
abbr --add ob mdbook serve --open

# ── Brew ─────────────────────────────────────────────────
alias bu="brew update && brew upgrade"
abbr --add bi brew install
abbr --add bic brew install --cask
abbr --add bl brew list
abbr --add br brew uninstall

# ── Btop ─────────────────────────────────────────────────
abbr --add b btop

# ── Clear ────────────────────────────────────────────────
abbr --add clc clear

# ── Codecrafters ─────────────────────────────────────────
abbr --add cct codecrafters test
abbr --add ccs codecrafters submit

# ── Dir-assistant ────────────────────────────────────────
abbr --add da dir-assistant

# ── Dotfile / config shortcuts ───────────────────────────
alias dfc="cd ~/.dotfiles/"
alias dfcreadme="nvim ~/.dotfiles/README.md"
alias nvimconfig="cd ~/.config/nvim/"
alias astroconfig="cd ~/.dotfiles/astronvim4/.config/nvim/"
alias lazyconfig="cd ~/.dotfiles/lazyvim/.config/nvim/"
alias fishconfig="nvim ~/.dotfiles/fish/.config/fish/config.fish && source ~/.config/fish/config.fish"
alias tmuxconfig="nvim ~/.dotfiles/tmux/.config/tmux/tmux.conf"
alias wezconfig="nvim ~/.wezterm.lua"
alias zellijconfig="nvim ~/.config/zellij/config.kdl"
alias snippets="cd ~/.config/nvim/snippets/"

# ── Fastfetch ────────────────────────────────────────────
abbr --add ff fastfetch

# ── Lazygit ──────────────────────────────────────────────
abbr --add lg lazygit

# ── Neovim ───────────────────────────────────────────────
abbr --add n nvim

# ── Onefetch ─────────────────────────────────────────────
abbr --add of onefetch

# ── Reload shortcuts ─────────────────────────────────────
alias fr="source ~/.config/fish/config.fish"
alias tmuxreload="tmux source ~/.config/tmux/tmux.conf"

# ── Tokei ────────────────────────────────────────────────
abbr --add tk tokei --num-format commas

# ── Update everything ────────────────────────────────────
alias u="brew update && brew upgrade && cargo install-update -a && uv self update && rustup self update && rustup update && ya pkg upgrade"
abbr --add tu topgrade

# ── Zellij ───────────────────────────────────────────────
abbr --add zj zellij
abbr --add za zellij attach
abbr --add zk zellij kill-session
abbr --add zl zellij list-sessions

# ── Better tools (eza) ───────────────────────────────────
if command -v eza >/dev/null
    alias ls="eza --git --icons --group-directories-first"
    alias ll="eza --git --icons -la --group-directories-first"
    alias lt="eza --git --icons -l -T --git-ignore --group-directories-first"
end
