# Cybersecurity Learning Widget for Omarchy

A functional and educational status bar widget for Omarchy/Hyprland that helps you learn and revise cybersecurity and ethical hacking concepts in a sweet and easy way.

![Shield Icon](https://img.shields.io/badge/Security-Learning-blue?style=flat-square&logo=security)
![Platform](https://img.shields.io/badge/Platform-Omarchy%20%7C%20Hyprland-blueviolet?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

## 🎯 Features

### Core Features
- **90+ Cybersecurity Terms**: Comprehensive database covering attacks, vulnerabilities, tools, defense, encryption, and frameworks
- **Auto-Rotation**: New term every 30 seconds for passive learning
- **Interactive Explanations**: Click the widget to see detailed explanations via popup notifications

### 🆕 Advanced Features
- **🎯 Quiz Mode**: Test your knowledge with flashcard-style questions
- **📊 Learning Statistics**: Track your progress, unique terms reviewed, and learning streaks
- **🎓 Difficulty Levels**: Filter terms by beginner, intermediate, or advanced categories
- **⌨️ Keyboard Shortcuts**: Quick access to all features via customizable keybindings
- **📈 Progress Tracking**: Visual progress indicators showing how many terms you've mastered

### Comprehensive Coverage
- Attack vectors (XSS, SQLi, CSRF, RCE, MITM, etc.)
- Vulnerabilities (IDOR, LFI, RFI, SSRF, XXE, SSTI)
- Security tools (Nmap, Burp Suite, Metasploit, Wireshark, Hashcat)
- Defense concepts (Firewalls, IDS/IPS, WAF, Honeypots)
- Encryption & Auth (AES, RSA, TLS, JWT, OAuth, MFA)
- Frameworks (OWASP, MITRE ATT&CK, CVE/CVSS)
- Team operations (Blue/Red/Purple Team, SOC, IR)

## 📸 Screenshot

The widget appears in your top bar as: `🛡️ XSS`

Click it to see: `🛡️ Cross-Site Scripting: Injecting malicious scripts into trusted websites`

## 🚀 Installation

### Prerequisites
- Omarchy Linux (or Hyprland with Quickshell)
- Bash shell
- Git

### Quick Install

```bash
# Clone the repository
cd ~/.config/omarchy/plugins/
git clone https://github.com/YOUR_USERNAME/cybersec-learning-widget.git spider.cybersec-learning

# Make scripts executable
chmod +x spider.cybersec-learning/*.sh

# Add to your bar configuration
```

Add the following to your `~/.config/omarchy/shell.json` in the appropriate bar section (left/center/right):

```json
{
  "id": "spider.cybersec",
  "type": "command",
  "exec": "~/.config/omarchy/plugins/spider.cybersec-learning/cybersec-widget.sh",
  "interval": 30,
  "tooltip": "Click to see explanation",
  "onClick": "~/.config/omarchy/plugins/spider.cybersec-learning/show-explanation.sh"
}
```

The configuration will hot-reload automatically. If needed, restart the shell:

```bash
omarchy restart shell
```

## 📚 Usage

### Basic Usage
1. **Passive Learning**: The widget automatically cycles through terms every 30 seconds
2. **Active Learning**: Click the widget anytime to see the full explanation
3. **Continuous Revision**: Keep learning throughout your workday

### 🎯 Quiz Mode
Test yourself with flashcard-style questions:
```bash
~/.config/omarchy/plugins/spider.cybersec-learning/quiz-mode.sh
```
Or use the keyboard shortcut: `Super+Shift+Q`

### 📊 View Statistics
Track your learning progress:
```bash
~/.config/omarchy/plugins/spider.cybersec-learning/show-stats.sh
```
Or use: `Super+Shift+S`

### 🎓 Difficulty Levels
Filter by skill level:
```bash
# Beginner terms (10 fundamental concepts)
~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh beginner

# Intermediate terms (10 common attack vectors)
~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh intermediate

# Advanced terms (10 sophisticated techniques)
~/.config/omarchy/plugins/spider.cybersec-learning/category-mode.sh advanced
```

### ⌨️ Keyboard Shortcuts

Run the setup script to see keybinding options:
```bash
~/.config/omarchy/plugins/spider.cybersec-learning/setup-keybindings.sh
```

**Default shortcuts** (add to `~/.config/hypr/bindings.lua`):
- `Super+Shift+C` - Show current term explanation
- `Super+Shift+Q` - Start quiz mode
- `Super+Shift+A` - Reveal quiz answer
- `Super+Shift+S` - Show learning statistics
- `Super+Ctrl+1` - Beginner terms
- `Super+Ctrl+2` - Intermediate terms
- `Super+Ctrl+3` - Advanced terms
- `Super+Shift+H` - Show help

## 🗂️ File Structure

```
spider.cybersec-learning/
├── cybersec-widget.sh           # Main widget script with terms database
├── show-explanation.sh          # Click handler for showing explanations
├── quiz-mode.sh                 # Quiz/flashcard mode
├── quiz-answer.sh               # Quiz answer revealer
├── show-stats.sh                # Learning statistics viewer
├── category-mode.sh             # Difficulty level filter
├── widget-controller.sh         # Multi-mode controller
├── setup-keybindings.sh         # Keyboard shortcuts setup guide
├── README.md                    # Documentation
├── LICENSE                      # MIT License
└── .gitignore                   # Git ignore file
```

### Data Files (Auto-generated)
```
~/.local/share/cybersec-widget/
├── quiz-stats.json              # Learning statistics
└── quiz-history.log             # Review history log
```

## 🎓 Learning Categories

- **Web Attacks**: XSS, SQLi, CSRF, SSRF, XXE, SSTI
- **Network Attacks**: MITM, DoS/DDoS, Phishing
- **Exploitation**: RCE, Shellcode, Reverse/Bind Shells, Privilege Escalation
- **Reconnaissance**: Recon, Enumeration, Footprinting, Pivoting
- **Malware**: RAT, Keylogger, Ransomware, Rootkit, Backdoor, Botnet
- **Cryptography**: Hash, Salt, Rainbow Tables, AES, RSA, TLS/SSL
- **Password Cracking**: Brute Force, Dictionary Attacks, Hydra, John, Hashcat
- **Security Tools**: Nmap, Burp, Metasploit, Wireshark, SQLmap, Netcat
- **Defense**: Firewall, IDS/IPS, WAF, Sandbox, Honeypot, SIEM, SOC
- **Authentication**: MFA, 2FA, SSO, OAuth, JWT
- **Standards**: OWASP, CVE, CVSS, CWE, MITRE ATT&CK, CIA Triad

## 🔧 Customization

### Change Rotation Interval

Edit the `interval` value in `shell.json` (in seconds):

```json
"interval": 60  // Changes term every minute
```

### Add Your Own Terms

Edit `cybersec-widget.sh` and add to the `cybersec_terms` array:

```bash
["YourTerm"]="Your Term: Detailed explanation here"
```

### Change Notification Duration

Edit `show-explanation.sh` and modify the duration parameter (in milliseconds):

```bash
hyprctl notify 2 10000 "rgb(89b4fa)" "🛡️ $explanation"  # 10 seconds
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add more cybersecurity terms
- Improve explanations
- Add new features
- Report bugs or suggestions

## 📝 License

MIT License - Feel free to use and modify as you wish!

## 🎯 Roadmap

- [x] Quiz mode with flashcard-style questions
- [x] Learning statistics and progress tracking
- [x] Difficulty levels (beginner/intermediate/advanced)
- [x] Category filtering
- [x] Keyboard shortcuts for quick access
- [ ] Spaced repetition algorithm (SRS)
- [ ] Export/import custom term sets
- [ ] Web dashboard for detailed analytics
- [ ] Daily challenges and streaks
- [ ] Integration with CTF platforms

## 💡 Inspiration

Built to make cybersecurity learning accessible and continuous while working on your system. Perfect for students, penetration testers, security researchers, and anyone interested in ethical hacking.

---

Made with 🛡️ for the security community
