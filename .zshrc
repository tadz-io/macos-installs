eval "$(starship init zsh)"
# zsh autocompletions
autoload -Uz compinit && compinit
# Enable menu selection with Tab
zstyle ':completion:*' menu select
# zsh auto-suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

