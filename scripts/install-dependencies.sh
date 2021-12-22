set -e

# emacs packages and the npm dependencies that require them
# eglot: typescript typescript-language-server
# prettier: prettier

npm install -g typescript typescript-language-server prettier

# rust packages needed for emacs-racer
# specific nightly compiler used due to https://github.com/racer-rust/racer/issues/1173#issuecomment-991560508
rustup toolchain add nightly-2021-06-07
rustup component add rust-src
cargo +nightly-2021-06-07 install racer
