#!/usr/bin/env bash
# Keyboard shortcuts setup for Hyprland

# This script provides keybinding suggestions for ~/.config/hypr/bindings.lua
# Add these to your Hyprland config for quick access to widget features

cat << 'EOF'
# Cybersecurity Learning Widget Keyboard Shortcuts
# Add these to your ~/.config/hypr/bindings.lua file:

# Show current term explanation
o.bind("SUPER_SHIFT", "C", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/show-explanation.sh")
end, { desc = "Show cybersec term explanation" })

# Start quiz mode
o.bind("SUPER_SHIFT", "Q", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/quiz-mode.sh")
end, { desc = "Start cybersec quiz" })

# Reveal quiz answer
o.bind("SUPER_SHIFT", "A", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/quiz-answer.sh")
end, { desc = "Reveal quiz answer" })

# Show learning statistics
o.bind("SUPER_SHIFT", "S", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/show-stats.sh")
end, { desc = "Show learning stats" })

# Category filters
o.bind("SUPER_CTRL", "1", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh beginner")
end, { desc = "Cybersec: Beginner terms" })

o.bind("SUPER_CTRL", "2", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh intermediate")
end, { desc = "Cybersec: Intermediate terms" })

o.bind("SUPER_CTRL", "3", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh advanced")
end, { desc = "Cybersec: Advanced terms" })

# Help
o.bind("SUPER_SHIFT", "H", function()
  o.exec("~/.config/omarchy/plugins/spider.cybersec-learning/widget-controller.sh help")
end, { desc = "Cybersec widget help" })

EOF

echo ""
echo "✅ To enable keyboard shortcuts:"
echo "1. Open ~/.config/hypr/bindings.lua"
echo "2. Add the bindings shown above"
echo "3. Save the file (Hyprland auto-reloads)"
echo ""
echo "📋 Quick Reference:"
echo "  Super+Shift+C : Show current term explanation"
echo "  Super+Shift+Q : Start quiz mode"
echo "  Super+Shift+A : Reveal quiz answer"
echo "  Super+Shift+S : Show learning statistics"
echo "  Super+Ctrl+1  : Beginner terms"
echo "  Super+Ctrl+2  : Intermediate terms"
echo "  Super+Ctrl+3  : Advanced terms"
echo "  Super+Shift+H : Show help"
