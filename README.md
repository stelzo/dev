# Dev Setup

Setting up my general development environment with scripts, fonts, code editors, etc.

## Arch (CachyOS)

The new setup is using CachyOS as base distro. For the old one, skip to the Ubuntu section.

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
sudo pacman -S ghostty rustup go zig cargo-zigbuild cargo-msrv ripgrep presenterm zoxide eza tokei starship gitui taplo-cli tinymist yaml-language-server neovim tmux cargo-binstall yazi starship ttf-iosevka-nerd ttf-iosevkaterm-nerd rofi hyprpicker python-pywal blueman bluez networkmanager swaync xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr hyprpaper hyprlock dmenu cava uv resvg

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
curl -s https://install.steado.tech/typst | sh
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

paru -S swww pywal wofi fd python-pywalfox quickshell-git fish-bass-git
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
