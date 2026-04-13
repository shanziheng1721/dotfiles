# ╔═══════════════════════════════════════════════════════╗
# ║                     rust.fish                         ║
# ║          Cargo and Rustup abbreviations               ║
# ╚═══════════════════════════════════════════════════════╝

# ── Cargo ────────────────────────────────────────────────
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
abbr --add ctr cargo test --release
abbr --add cup cargo install-update -a
abbr --add cui cargo uninstall

# ── Rustup ───────────────────────────────────────────────
abbr --add ru rustup update
abbr --add rsu rustup self update
