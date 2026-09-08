#!/usr/bin/env bash
# Reveal quiz answer and track statistics

QUIZ_FILE="${XDG_RUNTIME_DIR:-/tmp}/cybersec-quiz-current"
STATS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cybersec-widget"
QUIZ_STATS="$STATS_DIR/quiz-stats.json"

if [[ -f "$QUIZ_FILE" ]]; then
    IFS='|' read -r term answer < "$QUIZ_FILE"
    
    # Show answer
    hyprctl notify 2 10000 "rgb(a6e3a1)" "🎯 Answer: $term

$answer

Good job reviewing!" >/dev/null 2>&1
    
    # Update stats
    if [[ -f "$QUIZ_STATS" ]]; then
        total=$(jq '.total_questions + 1' "$QUIZ_STATS")
        jq ".total_questions = $total" "$QUIZ_STATS" > "${QUIZ_STATS}.tmp" && mv "${QUIZ_STATS}.tmp" "$QUIZ_STATS"
    fi
    
    # Log quiz attempt
    echo "$(date -Iseconds)|$term|revealed" >> "$STATS_DIR/quiz-history.log"
    
    rm "$QUIZ_FILE"
else
    hyprctl notify 1 3000 "rgb(f38ba8)" "🎯 No active quiz. Right-click the widget to start a quiz!" >/dev/null 2>&1
fi
