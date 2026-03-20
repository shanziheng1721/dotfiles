# ╔═══════════════════════════════════════════════════════╗
# ║                   homebrew.fish                       ║
# ║     Cross-platform Homebrew environment setup         ║
# ╚═══════════════════════════════════════════════════════╝
# Reference: https://github.com/orgs/Homebrew/discussions/4412#discussioncomment-8314181

if test -d /home/linuxbrew/.linuxbrew
    # ── Linux ────────────────────────────────────────────
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    fish_add_path "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
    set -q MANPATH; or set MANPATH ''
    set -q INFOPATH; or set INFOPATH ''
    set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
    set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
else if test -d /opt/homebrew
    # ── macOS (Apple Silicon / Intel) ───────────────────
    /opt/homebrew/bin/brew shellenv | source
    set -gx LIBRARY_PATH "$LIBRARY_PATH:$(brew --prefix)/lib"
    set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@17/include"
end
