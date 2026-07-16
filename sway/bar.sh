#!/bin/sh
# Status bar script for swaybar.
# Prints "Vol: XX% | Day Month DD YYYY | HH:MM AM/PM" once a second.

while true; do
    if raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null); then
        case "$raw" in
            *MUTED*)
                volume="muted"
                ;;
            *)
                # raw looks like "Volume: 0.45"
                pct=$(echo "$raw" | awk '{printf "%d", $2 * 100}')
                volume="${pct}%"
                ;;
        esac
    else
        volume="n/a"
    fi

    current_date=$(date "+%a %b %d %Y | %I:%M %p")

    printf 'Vol: %s || %s\n' "$volume" "$current_date"
    sleep 1
done
