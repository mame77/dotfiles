
# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

# env
export TERM="xterm-256color"
export BUN_INSTALL="$HOME/.bun"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
