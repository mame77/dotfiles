#!/usr/bin/bash

gitconfig=".gitconfig"
bashrc=".bashrc"
tmux="tmux"
ghostty="ghostty"
nvim="nvim"
niri="niri"
waybar="waybar"
mako="mako"

function link_file { local file_name="$1" local target_dir="$2"
    local link_name="${3:-$(basename $file_name)}"
    local link_file="$(pwd)/$file_name"
    local link_target="${target_dir}/${link_name}"
    
    # if exist
    if [[ -L "$link_target" ]]; then
        echo -e "$link_name \e[32malready linked\e[0m"
        return
    fi
    if [[ -e "$link_target" ]]; then
        echo -e "$link_name \e[31mexists\e[0m"
        return
    fi
    # create symbliclink
    ln -s "$link_file" "$link_target" && echo -e "$link_name \e[32mlinked\e[0m"
}

# link
link_file "$gitconfig" "$HOME" ".gitconfig"
link_file "$bashrc"  "$HOME"   ".bashrc"
link_file "$tmux"    "$HOME/.config"
link_file "$mako"    "$HOME/.config"
link_file "$ghostty" "$HOME/.config"
link_file "$nvim"    "$HOME/.config"
link_file "$niri"    "$HOME/.config"
link_file "$waybar"  "$HOME/.config"
