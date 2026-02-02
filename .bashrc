# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"
export CC="$(which gcc)"
export CXX="$(which g++)"
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
# base
shopt -s autocd
bind ': menu-complete'
bind ': menu-complete-backward'
mkcd(){ mkdir -p -- "$1" && cd -- "$1"; }
# alias
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"
alias sp="sudo ss -ltnup | grep LISTEN"
alias sd="sudo sv restart docker"
