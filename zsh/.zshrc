
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
# alias
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color=auto"
alias grep='grep --color=auto'
# git
alias gcm="git commit"
alias gcma="git commit --amend"
alias grbc="git rebase --continue"
alias gpush="git push origin HEAD"
alias gpf="git push --force-with-lease origin HEAD"
# Plugins
zstyle ':completion:*' menu select
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autopair/autopair.zsh
# prompt
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
PS1='-> %F{cyan}%2~%f$(git_branch) $ '

