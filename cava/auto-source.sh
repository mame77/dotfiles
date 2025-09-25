#!/bin/bash

# 実際に音楽が再生されているシンクを検出してcavaのソースを決定
get_active_sink_monitor() {
    # 実行中のシンクを取得
    local running_sink=$(pactl list short sinks | grep RUNNING | head -1 | cut -f2)

    if [[ -n "$running_sink" ]]; then
        echo "${running_sink}.monitor"
    else
        # フォールバック：デフォルトシンクのmonitor
        local default_sink=$(pactl info | grep "Default Sink:" | cut -d' ' -f3)
        echo "${default_sink}.monitor"
    fi
}

# 現在のアクティブソースを取得
ACTIVE_SOURCE=$(get_active_sink_monitor)

# 一時的な設定ファイルを作成
TEMP_CONFIG="/tmp/cava_config_$$"
cp /home/mame/dotfiles/cava/config "$TEMP_CONFIG"

# ソースを動的に設定
sed -i "s|source = .*|source = $ACTIVE_SOURCE|" "$TEMP_CONFIG"

# cavaを実行
cava -p "$TEMP_CONFIG" "$@"

# 一時ファイルを削除
rm -f "$TEMP_CONFIG"