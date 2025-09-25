#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Scripts for volume controls for audio and mic 

iDIR="$HOME/.config/swaync/icons"
sDIR="$HOME/.config/hypr/scripts"

# Get Volume
get_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        echo "Muted"
    else
        echo "$volume %"
    fi
}

# Get icons
get_icon() {
    current=$(get_volume)
    if [[ "$current" == "Muted" ]]; then
        echo "$iDIR/volume-mute.png"
    elif [[ "${current%\%}" -le 30 ]]; then
        echo "$iDIR/volume-low.png"
    elif [[ "${current%\%}" -le 60 ]]; then
        echo "$iDIR/volume-mid.png"
    else
        echo "$iDIR/volume-high.png"
    fi
}

# Notify
notify_user() {
    if [[ "$(get_volume)" == "Muted" ]]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$(get_icon)" " Volume:" " Muted"
    else
        notify-send -e -h int:value:"$(get_volume | sed 's/%//')" -h string:x-canonical-private-synchronous:volume_notif -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$(get_icon)" " Volume Level:" " $(get_volume)"
        # "$sDIR/Sounds.sh" --volume
    fi
}

# Increase Volume
inc_volume() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        toggle_mute
    else
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && notify_user
    fi
}

# Decrease Volume
dec_volume() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        toggle_mute
    else
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify_user
    fi
}

# Toggle Mute
toggle_mute() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
    if [[ "$muted" != "MUTED" ]]; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 1 && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$iDIR/volume-mute.png" " Mute"
    else
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$(get_icon)" " Volume:" " Switched ON"
    fi
}

# Toggle Mic
toggle_mic() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")
    if [[ "$muted" != "MUTED" ]]; then
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1 && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$iDIR/microphone-mute.png" " Microphone:" " Switched OFF"
    else
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0 && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$iDIR/microphone.png" " Microphone:" " Switched ON"
    fi
}
# Get Mic Icon
get_mic_icon() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        echo "$iDIR/microphone-mute.png"
    else
        echo "$iDIR/microphone.png"
    fi
}

# Get Microphone Volume
get_mic_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print int($2*100)}')
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        echo "Muted"
    else
        echo "$volume %"
    fi
}

# Notify for Microphone
notify_mic_user() {
    volume=$(get_mic_volume)
    icon=$(get_mic_icon)
    notify-send -e -h int:value:"$volume" -h "string:x-canonical-private-synchronous:volume_notif" -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$icon"  " Mic Level:" " $volume"
}

# Increase MIC Volume
inc_mic_volume() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        toggle_mic
    else
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+ && notify_mic_user
    fi
}

# Decrease MIC Volume
dec_mic_volume() {
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o "MUTED")
    if [[ "$muted" == "MUTED" ]]; then
        toggle_mic
    else
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%- && notify_mic_user
    fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
elif [[ "$1" == "--get-mic-icon" ]]; then
	get_mic_icon
elif [[ "$1" == "--mic-inc" ]]; then
	inc_mic_volume
elif [[ "$1" == "--mic-dec" ]]; then
	dec_mic_volume
else
	get_volume
fi