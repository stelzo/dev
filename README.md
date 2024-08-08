# Dev Setup

nvim format code: visual mode + ä

brew install wezterm font-meslo-lg-nerd-font powerlevel10k zsh-autosuggestions zsh-syntax-highlighting

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

brew install zsh-autosuggestions

echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

brew install eza (better ls)

alias ls="eza --icons=always"

.zshrc:
eval "$(zoxide init zsh)"
alias cd="z"
alias htop="btop"

brew install btop zellij nvim ripgrep zoxide

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
