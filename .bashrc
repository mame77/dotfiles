# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
# env
export EDITOR=nvim
export TERM="xterm-256color"
export BUN_INSTALL="$HOME/.bun"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# base
git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ($branch)"
    fi
}
PS1='-> \[\e[36m\]\w\[\e[0m\]$(git_branch) $ '
# alias
shopt -s autocd
alias nv="nvim"
alias cl="clear"
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias xbps-install="sudo xbps-install -S"
mkcd(){ mkdir -p -- "$1" && cd -- "$1"; }
eval "$(zoxide init bash)"

