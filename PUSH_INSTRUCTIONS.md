# Instructions to Push to GitHub

## Step 1: Authenticate with GitHub (in your terminal)

Open a new terminal and run:
```bash
gh auth login
```

Follow the prompts:
1. Choose "GitHub.com"
2. Choose "HTTPS"
3. Choose "Login with a web browser"
4. Copy the one-time code shown
5. Press Enter to open browser
6. Paste the code and authorize

## Step 2: Create Repository and Push

Once authenticated, run these commands:

```bash
cd ~/.config/omarchy/plugins/spider.cybersec-learning

# Create the repository on GitHub and push
gh repo create cybersec-learning-widget \
  --public \
  --description "A functional cybersecurity learning widget for Omarchy/Hyprland - Learn ethical hacking concepts passively with 90+ terms, quiz mode, statistics tracking, and difficulty levels" \
  --source=. \
  --remote=origin \
  --push
```

## Alternative: Manual Method (if gh fails)

1. Go to https://github.com/new
2. Repository name: `cybersec-learning-widget`
3. Description: `Cybersecurity learning widget for Omarchy - Learn ethical hacking with 90+ terms, quiz mode & stats`
4. Choose Public
5. Don't initialize with README (we already have one)
6. Click "Create repository"

Then run:
```bash
cd ~/.config/omarchy/plugins/spider.cybersec-learning
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/cybersec-learning-widget.git
git push -u origin main
```

Replace YOUR_USERNAME with your GitHub username.

## Current Status

✅ All files are ready and committed
✅ 2 commits: Initial release + Advanced features
✅ All scripts are executable
✅ Documentation is complete

Files ready to push:
- cybersec-widget.sh (Main widget)
- show-explanation.sh (Click handler)
- quiz-mode.sh (Quiz/flashcard mode)
- quiz-answer.sh (Answer revealer)
- show-stats.sh (Statistics viewer)
- category-mode.sh (Difficulty filters)
- widget-controller.sh (Mode controller)
- setup-keybindings.sh (Keyboard shortcuts guide)
- README.md (Full documentation)
- LICENSE (MIT)
- .gitignore

Total: 90+ cybersecurity terms with all features implemented!
