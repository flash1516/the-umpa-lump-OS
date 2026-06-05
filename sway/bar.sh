#!/bin/env sh

while true; do
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100 "%"}')
    current_date=$(date "+%I:%M %p | %A %B %d %Y")
    echo "Vol: $volume || $current_date"
    sleep 1
done
