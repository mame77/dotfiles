#!/bin/bash

# 明るさを変更
brightnessctl set "$1"

# 現在の明るさを取得
CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)

# パーセンテージを計算
BRIGHTNESS_PERCENT=$(awk "BEGIN {printf \"%.0f\", $CURRENT * 100 / $MAX}")

# 通知を送信
notify-send -t 2000 -h string:x-canonical-private-synchronous:brightness -h int:value:$BRIGHTNESS_PERCENT "明るさ: ${BRIGHTNESS_PERCENT}%" "☀️"
