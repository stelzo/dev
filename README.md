# Dev Setup

Follow all steps. Nothing is optional.

## Ubuntu

Golang
```sh
sudo snap install go --classic
```

Rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Zig

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

zsh
```sh
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
chsh # set /usr/bin/zsh
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

### Tools

`cd`, `ls` etc. alternatives
```sh
cargo install eza
cargo install zoxide
cargo install ripgrep
cargo install cargo-mommy
cargo install presenterm
sudo apt install btop
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

Get Ghostty and build it.
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

Start Ghostty.

Neovim. Needs current version, apt is too old.
```sh
sudo snap install nvim --classic
```

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

## Mac
brew install wezterm font-meslo-lg-nerd-font powerlevel10k zsh-autosuggestions zsh-syntax-highlighting nvim

echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

source ~/.zshrc

nano ~/.zshrc und 
	HISTFILE=$HOME/.zhistory
	SAVEHIST=1000
	HISTSIZE=999
	setopt share_history
	setopt hist_expire_dups_first
	setopt hist_ignore_dups
	setopt hist_verify
cat -v, do "up" and "down" arrow and check codes.

nach ~/.zshrc:
	# completion using arrow keys (based on history)
	bindkey '^[[A' history-search-backward
	bindkey '^[[B' history-search-forward
 
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

brew install eza (better ls)

alias ls="eza --icons=always"

.zshrc:
eval "$(zoxide init zsh)"
alias cd="z"
alias htop="btop"
export XDG_CONFIG_HOME=$HOME/.config

brew install btop tmux nvim ripgrep zoxide presenterm


nvim format code: visual mode + ä

## tmux commands
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
