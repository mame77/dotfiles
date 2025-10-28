#!/usr/bin/env fish

set tmux     "tmux"
set ghostty  "ghostty"
set nvim     "nvim"
set niri     "niri"
set waybar   "waybar"

function link_file
    set link_file (pwd)/$argv[1]
    set file_name (basename $argv[1])
    set link_target $argv[2]/$file_name
    
    # if exist
    if test -L $link_target
        echo -e "$file_name \e[32malready linked\e[0m"
        return
    end
    if test -f $link_target
        echo -e "$file_name \e[31mexists\e[0m"
        return
    end
    # create symbliclink
    ln -s $link_file $link_target && echo -e "$file_name \e[32mlinked\e[0m"
end

# file link
link_file $tmux    $HOME/.config
link_file $ghostty $HOME/.config
link_file $nvim    $HOME/.config
link_file $niri    $HOME/.config
link_file $waybar  $HOME/.config
