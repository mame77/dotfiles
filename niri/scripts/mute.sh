#!/bin/bash

# ミュート切り替え
wpctl set-mute "@DEFAULT_AUDIO_SINK@" toggle

# 現在の音量を取得
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
VOLUME_PERCENT=$(awk "BEGIN {printf \"%.0f\", $VOLUME * 100}")

# ミュート状態をチェック
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")

if [ -n "$MUTED" ]; then
    notify-send -t 2000 -h string:x-canonical-private-synchronous:volume "音量: ミュート" "🔇"
else
    notify-send -t 2000 -h string:x-canonical-private-synchronous:volume -h int:value:$VOLUME_PERCENT "音量: ${VOLUME_PERCENT}%" "🔊"
fi
