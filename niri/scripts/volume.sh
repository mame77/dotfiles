#!/bin/bash

# 音量を変更
wpctl set-volume "@DEFAULT_AUDIO_SINK@" "$1"

# 現在の音量を取得 (0.00-1.00の範囲)
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
# パーセンテージに変換
VOLUME_PERCENT=$(awk "BEGIN {printf \"%.0f\", $VOLUME * 100}")

# ミュート状態をチェック
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")

if [ -n "$MUTED" ]; then
    notify-send -t 2000 -h string:x-canonical-private-synchronous:volume "音量: ミュート" "🔇"
else
    # プログレスバー用のヒントを追加
    notify-send -t 2000 -h string:x-canonical-private-synchronous:volume -h int:value:$VOLUME_PERCENT "音量: ${VOLUME_PERCENT}%" "🔊"
fi
