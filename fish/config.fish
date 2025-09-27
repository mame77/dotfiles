# PATH
set -x PATH /usr/bin /bin /usr/sbin /sbin /usr/local/bin ~/.local/bin
fish_add_path ~/.local/bin/
fish_add_path ~/.npm-global/bin

# welcome message invalid
set -g fish_greeting

# Ctrl+D  exit invalid
set -g fish_exit_on_interrupt 0

# alias
alias ..='cd ..'
alias ...='cd ../..'

# new directry cd
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

# git checkout OO → go OO
function go
    git checkout $argv
end

# git checkout -b OO → gb OO
function gb
    git checkout -b $argv
end

# git add O → ga O
function ga
    git add $argv
end

# git status → gs
function gs
    git status
end

# git commit -m "OO" → gc OO
function gc
    git commit -m "$argv"
end

# git push origin OO → gp OO
function gp
    git push origin $argv
end

# tmux a || tmux  → tm
function tm
    tmux a || tmux 
end

