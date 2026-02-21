if not status --is-interactive
    exit 0 # fix programs like scp or rsync
end

source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set -x PATH /home/chsieh/.local/bin $PATH
set -x PATH /home/chsieh/bin $PATH

# Cuda
set -x PATH /opt/cuda/bin $PATH
set -gx CUDA_HOME /opt/cuda

set -gx GPG_TTY (tty)

alias ls="eza --icons=always"
alias cd="z"
alias htop="btop"
alias rgg="rg -HnC2"
alias gg="gitui -t catppuccin-mocha.ron"

zoxide init fish | source
starship init fish | source # too slow

set -gx CARGO_MOMMYS_MOODS thirsty/chill/ominous
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR /home/chsieh/.cargo/bin/hx
set -gx TERM xterm-256color

# ollama
# set -gx ANTHROPIC_AUTH_TOKEN ollama
# set -gx ANTHROPIC_API_KEY ""
# set -gx ANTHROPIC_BASE_URL http://192.168.0.4:11434

cat ~/.cache/wal/sequences &
disown
