if status is-interactive
    # Commands to run in interactive sessions can go here
end

# -------------- Homebrew --------------

# from https://github.com/orgs/Homebrew/discussions/4412#discussioncomment-8314181
if test -d /home/linuxbrew/.linuxbrew
    # Homebrew is installed on Linux

    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
    set -q MANPATH; or set MANPATH ''
    set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
    set -q INFOPATH; or set INFOPATH ''
    set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

    # Homebrew asked for this in order to `brew upgrade`
    # set -gx HOMEBREW_GITHUB_API_TOKEN {api token goes here, don't remember where that's created}
else if test -d /opt/homebrew
    # Homebrew is installed on MacOS

    /opt/homebrew/bin/brew shellenv | source
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
    # export PATH="$HOME/.jenv/bin:$PATH"
    # eval "$(jenv init -)"
    set -gx CPPFLAGS -I/opt/homebrew/opt/openjdk/include
    set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@17/include"
end

# -------------- General Fish Config --------------

# ---- environment variables ----
set -U fish_user_paths ~/.npm-packages/bin $fish_user_paths

# ---- editor = nvim ----
set -gx EDITOR nvim

# ---- fish vim mode ----
set -g fish_key_bindings fish_vi_key_bindings

# ---- fish vim mode ----
set -g fish_color_command green

# -------------- Aliases and Shortcuts --------------

# ---- books ----
alias bk="cd ~/Developer/cloned/books/"
abbr --add ob mdbook serve --open

# ---- brew ----
alias bu="brew update && brew upgrade"
abbr --add bi brew install
abbr --add bic brew install --cask
abbr --add bl brew list
abbr --add br brew uninstall

# ---- btop ----
abbr --add b btop

# ---- clear ----
abbr --add clc clear

# ---- codecrafters ----
abbr --add cct codecrafters test
abbr --add ccs codecrafters submit

# ---- dir-assistant ----
abbr --add da dir-assistant

# ---- configs ----
alias dfc="cd ~/.dotfiles/"
alias dfcreadme="nvim ~/.dotfiles/README.md"
alias nvimconfig="cd ~/.config/nvim/"
alias astroconfig="cd ~/.dotfiles/astronvim4/.config/nvim/"
alias lazyconfig="cd ~/.dotfiles/lazyvim/.config/nvim/"
alias fishconfig="nvim ~/.dotfiles/fish/.config/fish/config.fish && source ~/.config/fish/config.fish"
alias tmuxconfig="nvim ~/.dotfiles/tmux/.config/tmux/tmux.conf"
alias snippets="cd ~/.config/nvim/snippets/"

# ---- fastfetch ----
abbr --add ff fastfetch

# ---- ICL database ----
if test -e ~/.pgdb-zs524-zs524
    source ~/.pgdb-zs524-zs524
end

# ---- important dirs ----
if test -d ~/Developer
    alias dev="cd ~/Developer/"
    alias ICL="cd ~/Developer/ICL/"
    alias cloned="cd ~/Developer/cloned/"
    alias teaching="cd ~/Developer/teaching/"
else
    alias dev="cd ~/dev/"
    alias ICL="cd ~/dev/ICL/"
    alias cloned="cd ~/dev/cloned/"
    alias teaching="cd ~/dev/teaching/"
end
alias dt="cd ~/Desktop/"
alias doc="cd ~/Documents/"
alias cven="cd ~/Documents/curriculum-vitae/"
alias cvcn="cd ~/Documents/curriculum-vitae-cn/"

# ---- lazygit ----
abbr --add lg lazygit

# ---- neovim ----
abbr --add n nvim

# ---- on lab machine ----
if test -e /vol/linux/bin/nfiles
    alias nfiles="/vol/linux/bin/nfiles"
end

# ---- onefetch ----
abbr --add of onefetch

# ---- perlbrew ----
. ~/perl5/perlbrew/etc/perlbrew.fish

# ---- python ----
# ---- python virtual env ----
if command -v uv >/dev/null
    abbr --add vc uv venv
else
    alias vc="python3 -m venv .venv"
end
alias va="source .venv/bin/activate.fish"
alias vr="rm -rf .venv"
alias vd="deactivate"
# ---- uv ----
abbr --add upu uv python upgrade
abbr --add usu uv self update

# ---- raspberry pi ----
if test -d /media/storage/brian/
    alias animed="cd /media/storage/brian/videos/番/站外"
    alias anime="sudo /snap/bin/nvim /etc/transmission-rss.conf && sudo service transmission-rss restart"
end

# ---- reloads ----
alias fr="source ~/.config/fish/config.fish"
alias tmuxreload="tmux source ~/.config/tmux/tmux.conf"

# ---- rust ----
abbr --add c cargo
abbr --add ca cargo add
abbr --add cch cargo check
abbr --add ccl cargo clean
abbr --add ccp cargo clippy
abbr --add cb cargo build
abbr --add cbr cargo build --release
abbr --add cf cargo fmt
abbr --add cfc cargo fmt -- --check
abbr --add cfg cargo flamegraph
abbr --add ci cargo install
abbr --add cil cargo install --list
abbr --add cin cargo init
abbr --add cl cargo --list
abbr --add cr cargo run
abbr --add cre cargo run --example
abbr --add crr cargo run --release
abbr --add crre cargo run --release --example
abbr --add cs cargo search
abbr --add ct cargo test
abbr --add cup cargo install-update -a
abbr --add cui cargo uninstall

abbr --add ru rustup update
abbr --add rsu rustup self update

#  ---- ssh to lab machines at ICL ----
if command -v jot >/dev/null
    alias sshtolab="ssh -t zs524@shell$(jot -r 1 1 5).doc.ic.ac.uk /vol/linux/bin/sshtolab"
end

#  ---- sshfs ----
alias sshfspi="sshfs he_is@en.brianshan974.me:/ ~/raspberrypi_root/ -p 22 -o volname=PiRoot"
alias sshfspiall="sshfs he_is@en.brianshan974.me:/ ~/raspberrypi_root/ -p 22 -o volname=PiRoot && sshfs he_is@en.brianshan974.me:/home/he_is ~/raspberrypi_home/ -p 22 -o volname=PiHome && sshfs he_is@en.brianshan974.me:/media/storage/brian ~/raspberrypi_storage/ -p 22 -o volname=PiStorage"
alias sshfspihome="sshfs he_is@en.brianshan974.me:/home/he_is ~/raspberrypi_home/ -p 22 -o volname=PiHome"
alias sshfspistorage="sshfs he_is@en.brianshan974.me:/media/storage/brian ~/raspberrypi_storage/ -p 22 -o volname=PiStorage"
alias umountpiall="umount ~/raspberrypi_root && umount ~/raspberrypi_home && umount ~/raspberrypi_storage/"
alias umountpi="umount ~/raspberrypi_root"
alias umountpihome="umount ~/raspberrypi_home"
alias umountpistorage="umount ~/raspberrypi_storage/"

# ---- tokei ----
abbr --add tk tokei --num-format commas

# ---- wezterm ----
alias wezconfig="nvim ~/.wezterm.lua"

# ---- update ----
alias u="brew update && brew upgrade && cargo install-update -a && uv self update && rustup self update && rustup update && ya pkg upgrade"
abbr --add tu topgrade

# ---- zellij ----
abbr --add zj zellij
abbr --add za zellij attach
abbr --add zk zellij kill-session
abbr --add zl zellij list-sessions
alias zellijconfig="nvim ~/.config/zellij/config.kdl"

# -------------- Utils --------------

# ---- neofetch ----
# if command -v neofetch >/dev/null
#     neofetch
# end

# ---- thefuck ----
if command -v thefuck >/dev/null
    thefuck --alias | source
end

# -------------- Better Tools --------------

# ls
if command -v eza >/dev/null
    alias ls="eza --git --icons --group-directories-first"
    alias ll="eza --git --icons -la --group-directories-first"
    alias lt="eza --git --icons -l -T --git-ignore --group-directories-first"
end

# cat
if command -v bat >/dev/null
    alias cat="bat"
end

# -------------- Functions --------------

# yazi change directory
function yy
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file=$tmp
    set cwd (cat -- $tmp)
    if test -s $tmp
        if test -n "$cwd" -a "$cwd" != "$PWD"
            cd -- $cwd
            commandline -f repaint # updates the prompt
        end
    end
    rm -f -- $tmp
end

# -------------- Configs --------------

# ---- tmux ----
# if test -d ~/.config/tmux/plugins/
#     tmux
# end

# ---- tmux.fish ----
# set -gx fish_tmux_autostart true
set -gx fish_tmux_autoquit true

# -------------- Integration --------------

# The following snippet is meant to be used like this in your fish config:
#
# if status is-interactive
#     # Configure auto-attach/exit to your likings (default is off).
#     # set ZELLIJ_AUTO_ATTACH true
#     # set ZELLIJ_AUTO_EXIT true
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

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

# -------------- Added Automatically --------------

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/szh/.lmstudio/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# -------------- Starship --------------
starship init fish | source

# -------------- Atuin --------------
# atuin init fish | source

# -------------- skim --------------
sk --shell fish | source
