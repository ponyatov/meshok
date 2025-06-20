RTARGET = x86_64-unknown-linux-gnu
# RTARGET = aarch64-unknown-linux-gnu
# RTARGET = i686-pc-windows-gnu
# RTARGET = thumbv7em-none-eabihf
# RTARGET = thumbv7m-none-eabi
# RTARGET = wasm32-unknown-unknown

$(RUSTUP) $(CARGO):
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup target add x86_64-unknown-linux-gnu
# rustup target add aarch64-unknown-linux-gnu
# rustup target add i686-pc-windows-gnu
# rustup target add thumbv7em-none-eabihf
# rustup target add thumbv7m-none-eabi
# rustup target add wasm32-unknown-unknown
	rustup component add rust-analyzer rustfmt rust-src
	cargo install cargo-watch
# cargo install cargo-binutils
# rustup component add llvm-tools
# curl --proto '=https' --tlsv1.2 -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh
