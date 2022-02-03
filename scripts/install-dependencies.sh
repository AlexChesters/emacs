set -e

# emacs packages and the npm dependencies that require them
# eglot: typescript typescript-language-server
# prettier: prettier

npm install -g typescript typescript-language-server prettier

# rust packages needed for emacs-racer
rustup toolchain install nightly
rustup component add rustc-dev --toolchain=nightly
cargo +nightly install racer
