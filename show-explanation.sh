#!/usr/bin/env bash
# Script to show detailed explanation when clicking the widget

TERM_FILE="${XDG_RUNTIME_DIR:-/tmp}/cybersec-widget-term"

if [[ -f "$TERM_FILE" ]] && [[ -s "$TERM_FILE" ]]; then
    explanation=$(cat "$TERM_FILE")
    # Use hyprctl notify: icon level (0-4), duration in ms, color, message
    hyprctl notify 2 8000 "rgb(89b4fa)" "🛡️ $explanation" >/dev/null 2>&1
else
    hyprctl notify 1 3000 "rgb(f38ba8)" "🛡️ Widget is loading..." >/dev/null 2>&1
fi
