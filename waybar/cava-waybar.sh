#!/bin/bash

# デフォルトの形を表示（音声なしの状態）
default_bars="▁▁▁▁▁▁▁▁▁▁"

# cavaが利用可能かチェック
if ! command -v cava &> /dev/null; then
    echo "$default_bars"
    exit 0
fi

# cava実行、失敗時はデフォルト表示
{
    cava -p /home/mame/dotfiles/cava/config-waybar | while IFS=';' read -ra bars; do
        output=""
        # 左チャンネル（最初の5バー）- 左から右へ
        for i in {0..4}; do
            bar="${bars[$i]:-0}"
            case $bar in
                0) output+="▁" ;;
                1) output+="▁" ;;
                2) output+="▂" ;;
                3) output+="▃" ;;
                4) output+="▄" ;;
                5) output+="▅" ;;
                6) output+="▆" ;;
                7) output+="▇" ;;
                8) output+="█" ;;
                *) output+="▁" ;;
            esac
        done

        # 右チャンネル（後の5バー）- 右から左へ（逆順）
        for i in {9..5}; do
            bar="${bars[$i]:-0}"
            case $bar in
                0) output+="▁" ;;
                1) output+="▁" ;;
                2) output+="▂" ;;
                3) output+="▃" ;;
                4) output+="▄" ;;
                5) output+="▅" ;;
                6) output+="▆" ;;
                7) output+="▇" ;;
                8) output+="█" ;;
                *) output+="▁" ;;
            esac
        done

        echo "$output"
    done
} || {
    echo "$default_bars"
}
