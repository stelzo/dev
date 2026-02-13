# Dev Setup

Setting up my general development environment with scripts, fonts, code editors, etc.

## Arch

Git
```sh
sudo pacman -Syu git openssh
ssh-keygen -t ed25519 -C "stelzo@steado.de"
# copy to github and codeberg
systemctl restart sshd
```

This repo
```sh
cd ~
git init
git branch -m main
git remote add origin git@github.com:stelzo/dev.git
git fetch
git pull origin main
```

Tools
```sh
sudo pacman -S ghostty rustup go zig cargo-zigbuild cargo-msrv ripgrep presenterm zoxide eza tokei starship gitui taplo-cli tinymist yaml-language-server neovim tmux cargo-binstall yazi starship ttf-iosevka-nerd ttf-iosevkaterm-nerd waybar rofi hyprpicker python-pywal blueman bluez networkmanager swaync yay xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr hyprpaper hyprlock dmenu cava uv

rustup default stable
rustup component add rust-analyzer
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/bin

mkdir -p ~/projects/thirds && cd ~/projects/thirds
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
ln -Ts $PWD/runtime ~/.config/helix/runtime

cargo install mask
# curl -s https://install.steado.tech/typst | sh
cargo install --git https://github.com/astrale-sharp/typstfmt.git

rustup default nightly
cargo install --git https://github.com/itsjunetime/tdf
rustup default stable


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf

fish_add_path $HOME/.local/bin

cargo binstall cargo-mommy

sudo cp ~/.config/fonts/* /usr/share/fonts/TTF
fc-cache --force

ya pkg add BennyOe/tokyo-night

git clone https://codeberg.org/stelzo/tree-sitter-minot.git /tmp/tree-sitter-minot
mkdir -p ~/.config/helix/runtime/queries/minot
cp /tmp/tree-sitter-minot/queries/*.scm ~/.config/helix/runtime/queries/minot/

git clone https://codeberg.org/stelzo/tree-sitter-ratslang.git /tmp/tree-sitter-ratslang
mkdir -p ~/.config/helix/runtime/queries/ratslang
cp /tmp/tree-sitter-ratslang/queries/*.scm ~/.config/helix/runtime/queries/ratslang/

hx --grammar fetchc
hx --grammar build

yay -S swww pywal wofi fd python-pywalfox
fish_add_path ~/bin
ln -s ~/.config/hypr/wallpaper.sh ~/bin/wall
systemctl --user enable --now xdg-desktop-portal.service
systemctl --user enable --now xdg-desktop-portal-gtk.service

pywalfox install

git clone https://codeberg.org/LGFae/awww /tmp/awww
cd /tmp/awww
cargo build --release
sudo mv target/release/awww /usr/local/bin
sudo mv target/release/awww-daemon /usr/local/bin
cd -

```

Open Tmux and install everything: `Ctrl + Space + I`.


Cuda
```sh
sudo pacman -S cuda
fish_add_path /opt/cuda/bin/
```

## Ubuntu >=24.04

```sh
sudo apt-get install software-properties-common
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Go and Rust
```sh
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update --assume-yes
sudo apt-get install rustup golang-go --assume-yes
```

### Zig (optional)

Linux
```sh
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin
curl -L https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -o zig-linux.tar.xz
tar xf zig-linux.tar.xz
rm zig-linux.tar.xz
mv zig-linux-x86_64-0.13.0 zig
```

MacOS
```sh
brew install zig
```

### zsh
```sh
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s /usr/bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

to .zshrc
```
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


# shell autosuggestions
# eval "$(starship init zsh)"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/zig:$PATH"
export GPG_TTY=$(tty)

alias ls="eza --icons=always"
eval "$(zoxide init zsh)"
alias cd="z"
alias htop="btop"
alias rgg="rg -HnC2"
alias gg="gitui -t catppuccin-mocha.ron"
export PATH=$PATH:$(go env GOPATH)/bin
__git_files () { 
    _wanted files expl 'local files' _files     
}

# add personal scripts
export PATH="$HOME/bin:$PATH"

# Cargo mommy
export CARGO_MOMMYS_MOODS=thirsty/chill/ominous

export XDG_CONFIG_HOME=$HOME/.config
```

`cat -v`, do "up" and "down" arrow and check codes.
```
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
```

### Other Tools

`cd`, `ls` etc. alternatives
```sh
sudo apt install btop libpoppler-dev libpoppler-glib-dev zathura pdf-presenter-console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cargo install eza zoxide ripgrep cargo-mommy presenterm tokei mask starship gitui rerun-cli
cargo install taplo-cli --locked --features lsp

curl -s https://install.steado.tech/typst | sh
cargo install --git https://github.com/astrale-sharp/typstfmt.git
cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist

rustup default nightly
cargo install --git https://github.com/itsjunetime/tdf
rustup default stable

brew install yaml-language-server
rustup component add rust-analyzer

mkdir -p ~/projects/thirds && cd ~/projects/thirds
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
ln -Ts $PWD/runtime ~/.config/helix/runtime

go install github.com/charmbracelet/freeze@latest
curl -f https://zed.dev/install.sh | sh
brew install jesseduffield/lazygit/lazygit
```

Zed Theme

Visit and follow commands: https://github.com/catppuccin/zed. Mocha - no italics

#### Ghostty

> Note: ssh does not recognize the terminal correctly yet. When you have some errors regarding "Error opening terminal", do `export TERM=xterm-256color`.

Mac
```sh
brew install ghostty
```

Ubuntu

From Binary (recommended)
```sh
source /etc/os-release
curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest \
	| grep "browser_download_url.*amd64_${VERSION_ID}.deb" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| head -n 1 \
	| xargs -n 1 curl -LO
sudo dpkg -i ghostty_*amd64_${VERSION_ID}.deb
rm ghostty_*amd64_${VERSION_ID}.deb
```

If you get a dependency error, run `sudo apt-get install -f` once, then repeat the `dpkg` command.

From Source
```sh
sudo apt-get install libglib2.0-dev libgtk-4-dev libadwaita-1-dev

git clone https://github.com/ghostty-org/ghostty
cd ghostty
git checkout v1.0.0
zig build -p $HOME/.local -Doptimize=ReleaseFast
```

Configs (inplace update ~/ dir)
```sh
cd ~/
git init
git remote add origin git@github.com:stelzo/dev.git
git fetch origin
git checkout -b main --track origin/main

cp ~/.config/fonts/* ~/.fonts/
fc-cache -f -v
```

Neovim
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install neovim --assume-yes
```

Start Ghostty.

`nano .config/nvim/init.lua` Comment out (`--`) `require("stelzo")`, so the plugins are not parsed before the plugin manager is even installed.

Start `nvim` to install all plugins.

Remove previous comment.

Tmux 
```sh
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
```
`Ctrl + Space + I` (Install tmux deps)

### Rust Compiler Speedup
```sh
rustup default nightly
rustup update
rustup component add rustc-codegen-cranelift-preview --toolchain nightly
RUSTFLAGS="-Z threads=8" cargo build
```

or export `RUSTFLAGS` to your environment.

Now you can set a general config for cargo to use the cranelift backend for debug builds.

`~/.cargo/config`
```sh
[unstable]
codegen-backend = true

[profile.dev]
codegen-backend = "cranelift"
```

## Git Best Practices

```sh
gpg --full-generate-key
```

Follow: https://docs.codeberg.org/security/gpg-key/

## Mac [WIP]

```sh
brew install font-meslo-lg-nerd-font powerlevel10k zsh-autosuggestions zsh-syntax-highlighting nvim
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
source ~/.zshrc

```

Run `nano ~/.zshrc` and set
```
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
```

`cat -v`, do "up" and "down" arrow and check codes.

Add to `~/.zshrc`
```
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
```

```sh
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
brew install eza (better ls)
alias ls="eza --icons=always"
```

Add to `.zshrc`.
```sh
eval "$(zoxide init zsh)"
alias cd="z"
alias htop="btop"
export XDG_CONFIG_HOME=$HOME/.config
brew install btop tmux nvim ripgrep zoxide presenterm
```

### Tips

#### Nvim
nvim format code: visual mode + ä


#### tmux
ctrl + space -> leader

leader + c = create window
leader + [0;9] = select window
leader + & = kill window

leader + % = split pane hori
leader + " = split pane verti
leader + -> = select right pane, etc
leader + x = close pane

tmux ls = list sessions
tmux new -s <name> = new session

leader + w = preview windows of sessions
tmux attach -t <name> = attach to session

leader + I = Install tpm packages update
