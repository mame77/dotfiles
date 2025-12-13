#!/bin/bash

output_dir="$HOME/videos"

if [[ ! -d "$output_dir" ]]; then
    mkdir -p $output_dir
fi

screenrecording() {
  filename="$output_dir/screenrecording-$(date +'%y-%m-%d_%H-%M-%S').mp4"
  notify-send "screen recording starting..." -t 1000
  sleep 1

  if lspci | grep -Eqi 'nvidia|intel.*graphics'; then
    wf-recorder -f "$filename" -c libx264 -p crf=23 -p preset=medium -p movflags=+faststart "$@"
  else
    wl-screenrec -f "$filename" --ffmpeg-encoder-options="-c:v libx264 -crf 23 -preset medium -movflags +faststart" "$@"
  fi
}

if pgrep -x wl-screenrec >/dev/null || pgrep -x wf-recorder >/dev/null; then
  pkill -x wl-screenrec
  pkill -x wf-recorder
  notify-send "screen recording saved to $output_dir" -t 2000
else
  screenrecording
fi
