brew install wezterm

brew install font-meslo-lg-nerd-font

brew install powerlevel10k

echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

source ~/.zshrc

brew install zsh-autosuggestions zsh-syntax-highlighting

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

