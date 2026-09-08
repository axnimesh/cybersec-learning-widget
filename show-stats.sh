#!/usr/bin/env bash
# Statistics viewer - Show learning progress

STATS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cybersec-widget"
QUIZ_STATS="$STATS_DIR/quiz-stats.json"
QUIZ_HISTORY="$STATS_DIR/quiz-history.log"

# Ensure stats exist
if [[ ! -f "$QUIZ_STATS" ]]; then
    mkdir -p "$STATS_DIR"
    echo '{"total_questions":0,"correct":0,"incorrect":0,"streak":0,"best_streak":0,"terms_learned":[],"last_review":""}' > "$QUIZ_STATS"
fi

# Read stats
if command -v jq >/dev/null 2>&1; then
    total=$(jq -r '.total_questions // 0' "$QUIZ_STATS")
    terms_seen=$(jq -r '.terms_learned | length // 0' "$QUIZ_STATS")
    
    # Count unique terms from history
    if [[ -f "$QUIZ_HISTORY" ]]; then
        unique_terms=$(cut -d'|' -f2 "$QUIZ_HISTORY" | sort -u | wc -l)
    else
        unique_terms=0
    fi
    
    # Calculate progress
    total_available=90
    progress=$((unique_terms * 100 / total_available))
    
    # Get last review date
    if [[ -f "$QUIZ_HISTORY" ]]; then
        last_review=$(tail -1 "$QUIZ_HISTORY" | cut -d'|' -f1 | cut -d'T' -f1)
    else
        last_review="Never"
    fi
    
    # Display stats
    stats_text="📊 Learning Statistics

Total Reviews: $total
Unique Terms Seen: $unique_terms / $total_available
Progress: $progress%
Last Review: $last_review

Keep learning! 🛡️"
    
else
    # Fallback without jq
    if [[ -f "$QUIZ_HISTORY" ]]; then
        total=$(wc -l < "$QUIZ_HISTORY")
        unique_terms=$(cut -d'|' -f2 "$QUIZ_HISTORY" | sort -u | wc -l)
    else
        total=0
        unique_terms=0
    fi
    
    stats_text="📊 Learning Statistics

Total Reviews: $total
Unique Terms Seen: $unique_terms

Keep learning! 🛡️"
fi

hyprctl notify 2 10000 "rgb(89b4fa)" "$stats_text" >/dev/null 2>&1
echo "Stats displayed"
