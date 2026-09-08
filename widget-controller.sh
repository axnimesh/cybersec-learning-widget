#!/usr/bin/env bash
# Widget controller - Enhanced with multiple modes

MODE="${1:-normal}"

case "$MODE" in
    quiz)
        ~/.config/omarchy/plugins/spider.cybersec-learning/quiz-mode.sh
        ;;
    stats)
        ~/.config/omarchy/plugins/spider.cybersec-learning/show-stats.sh
        ;;
    beginner|intermediate|advanced)
        ~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh "$MODE"
        ;;
    help)
        hyprctl notify 2 10000 "rgb(89b4fa)" "🛡️ Cybersecurity Widget Help

Normal: Auto-rotation every 30s
Click: Show explanation
Right-click: Start quiz
Middle-click: Show statistics
Ctrl+Click: Beginner mode
Shift+Click: Advanced mode

Categories: beginner, intermediate, advanced" >/dev/null 2>&1
        ;;
    *)
        ~/.config/omarchy/plugins/spider.cybersec-learning/cybersec-widget.sh
        ;;
esac
