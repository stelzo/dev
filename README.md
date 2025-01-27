# Dev Setup

Setting up my general development environment with scripts, fonts, code editors, etc.

## Ubuntu >=24.04

```sh
sudo apt-get install software-properties-common
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

cargo install eza
cargo install zoxide
cargo install ripgrep
cargo install cargo-mommy
cargo install presenterm

rustup default nightly
cargo install --git https://github.com/itsjunetime/tdf
rustup default stable

go install github.com/charmbracelet/freeze@latest
curl -f https://zed.dev/install.sh | sh
```

Zed Theme

Visit and follow commands: https://github.com/catppuccin/zed. Mocha - no italics

#### Ghostty

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
