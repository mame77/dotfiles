#!/bin/bash

# バッテリー監視スクリプト
# 15%以下になったら通知を送る

# 通知済みフラグファイル
FLAG_FILE="/tmp/battery_warned"

while true; do
    # バッテリー情報を取得
    BATTERY_PATH="/sys/class/power_supply/BAT0"

    # バッテリーが存在するか確認
    if [ ! -d "$BATTERY_PATH" ]; then
        BATTERY_PATH="/sys/class/power_supply/BAT1"
    fi

    if [ -d "$BATTERY_PATH" ]; then
        # バッテリー残量を取得
        CAPACITY=$(cat "$BATTERY_PATH/capacity")
        STATUS=$(cat "$BATTERY_PATH/status")

        # 充電中の場合はフラグをリセット
        if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
            rm -f "$FLAG_FILE"
        # 15%以下で放電中の場合
        elif [ "$CAPACITY" -le 15 ] && [ "$STATUS" = "Discharging" ]; then
            # まだ通知していない場合のみ通知
            if [ ! -f "$FLAG_FILE" ]; then
                if [ "$CAPACITY" -le 5 ]; then
                    notify-send -u critical "🔋 バッテリー残量: ${CAPACITY}%" "すぐに充電してください！" -t 10000
                elif [ "$CAPACITY" -le 10 ]; then
                    notify-send -u critical "🔋 バッテリー残量: ${CAPACITY}%" "バッテリー残量が少なくなっています" -t 5000
                else
                    notify-send -u normal "🔋 バッテリー残量: ${CAPACITY}%" "充電することをおすすめします" -t 5000
                fi
                # 通知済みフラグを立てる
                touch "$FLAG_FILE"
            fi
        # 16%以上になったらフラグをリセット（充電したりして回復した場合）
        elif [ "$CAPACITY" -gt 16 ]; then
            rm -f "$FLAG_FILE"
        fi
    fi

    # 60秒ごとにチェック
    sleep 60
done
