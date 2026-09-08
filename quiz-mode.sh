#!/usr/bin/env bash
# Quiz Mode - Test your cybersecurity knowledge with flashcard-style questions

# Database of cybersecurity terms (same as widget)
declare -A cybersec_terms=(
    ["XSS"]="Cross-Site Scripting: Injecting malicious scripts into trusted websites"
    ["SQLi"]="SQL Injection: Inserting malicious SQL code to manipulate databases"
    ["CSRF"]="Cross-Site Request Forgery: Forcing users to execute unwanted actions"
    ["RCE"]="Remote Code Execution: Running arbitrary code on a remote system"
    ["MITM"]="Man-in-the-Middle: Intercepting communication between two parties"
    ["DoS"]="Denial of Service: Overwhelming a system to make it unavailable"
    ["DDoS"]="Distributed DoS: DoS attack from multiple sources"
    ["Phishing"]="Social engineering via fake emails/sites to steal credentials"
    ["IDOR"]="Insecure Direct Object Reference: Accessing unauthorized resources"
    ["LFI"]="Local File Inclusion: Reading files on the server"
    ["RFI"]="Remote File Inclusion: Including remote files to execute code"
    ["SSRF"]="Server-Side Request Forgery: Making server request internal resources"
    ["XXE"]="XML External Entity: Exploiting XML parsers to access files"
    ["SSTI"]="Server-Side Template Injection: Injecting code into templates"
    ["ROP"]="Return-Oriented Programming: Chaining existing code to exploit"
    ["ASLR"]="Address Space Layout Randomization: Memory protection technique"
    ["DEP"]="Data Execution Prevention: Prevents code execution in data regions"
    ["WAF"]="Web Application Firewall: Filters malicious HTTP traffic"
    ["IDS"]="Intrusion Detection System: Monitors for malicious activity"
    ["IPS"]="Intrusion Prevention System: Actively blocks threats"
    ["CVE"]="Common Vulnerabilities and Exposures: Public security flaw database"
    ["CVSS"]="Common Vulnerability Scoring System: Rates vulnerability severity"
    ["0day"]="Zero-Day: Exploit for unknown/unpatched vulnerability"
    ["APT"]="Advanced Persistent Threat: Long-term targeted attack"
    ["C2"]="Command & Control: Server controlling compromised systems"
    ["Payload"]="Malicious code delivered by an exploit"
    ["Shellcode"]="Low-level code that spawns a shell"
    ["Reverse Shell"]="Target connects back to attacker for remote access"
    ["Bind Shell"]="Opens port on target for attacker to connect"
    ["Privesc"]="Privilege Escalation: Gaining higher access level"
    ["Recon"]="Reconnaissance: Gathering information about targets"
    ["Enum"]="Enumeration: Detailed probing of target systems"
    ["Footprint"]="Information collected during reconnaissance phase"
    ["Pivoting"]="Using compromised system to attack other systems"
    ["C&C"]="Same as C2: Command and Control infrastructure"
    ["RAT"]="Remote Access Trojan: Malware for remote control"
    ["Keylogger"]="Records keystrokes to steal credentials"
    ["Ransomware"]="Encrypts data and demands payment for decryption"
    ["Rootkit"]="Hides malicious activity and maintains access"
    ["Backdoor"]="Hidden entry point for bypassing authentication"
    ["Botnet"]="Network of infected computers under attacker control"
    ["Hash"]="One-way cryptographic function output"
    ["Salt"]="Random data added to password before hashing"
    ["Rainbow Table"]="Precomputed hash database for cracking passwords"
    ["Brute Force"]="Trying all possible combinations to crack authentication"
    ["Dictionary Attack"]="Using wordlist to guess passwords"
    ["Hydra"]="Popular password cracking tool"
    ["John"]="John the Ripper: Password cracking tool"
    ["Hashcat"]="Advanced password recovery tool"
    ["Nmap"]="Network scanner for port and service discovery"
    ["Burp"]="Burp Suite: Web application security testing tool"
    ["Metasploit"]="Penetration testing framework"
    ["Wireshark"]="Network protocol analyzer for packet inspection"
    ["Gobuster"]="Directory/file brute-forcing tool"
    ["Nikto"]="Web server scanner"
    ["SQLmap"]="Automated SQL injection tool"
    ["Netcat"]="Network utility for reading/writing network connections"
    ["Socat"]="Advanced network relay tool"
    ["tcpdump"]="Command-line packet analyzer"
    ["Aircrack"]="Wi-Fi security auditing tool"
    ["OWASP"]="Open Web Application Security Project"
    ["CWE"]="Common Weakness Enumeration: Software weakness types"
    ["CIA Triad"]="Confidentiality, Integrity, Availability principles"
    ["AAA"]="Authentication, Authorization, Accounting"
    ["MFA"]="Multi-Factor Authentication: Multiple verification methods"
    ["2FA"]="Two-Factor Authentication: Two-step verification"
    ["SSO"]="Single Sign-On: One login for multiple services"
    ["OAuth"]="Open Authorization: Token-based authorization"
    ["JWT"]="JSON Web Token: Compact authentication token"
    ["TLS"]="Transport Layer Security: Encrypts network communication"
    ["SSL"]="Secure Sockets Layer: Predecessor to TLS"
    ["PKI"]="Public Key Infrastructure: Manages digital certificates"
    ["AES"]="Advanced Encryption Standard: Symmetric encryption"
    ["RSA"]="Asymmetric encryption algorithm"
    ["VPN"]="Virtual Private Network: Encrypted tunnel"
    ["Firewall"]="Network security barrier filtering traffic"
    ["DMZ"]="Demilitarized Zone: Buffer network between internal/external"
    ["Sandbox"]="Isolated environment for testing suspicious code"
    ["Honeypot"]="Decoy system to detect/study attacks"
    ["Blue Team"]="Defensive security: Protecting systems"
    ["Red Team"]="Offensive security: Simulating attacks"
    ["Purple Team"]="Collaboration between blue and red teams"
    ["SIEM"]="Security Info & Event Management: Log analysis platform"
    ["SOC"]="Security Operations Center: Monitors security threats"
    ["IR"]="Incident Response: Handling security breaches"
    ["Forensics"]="Digital investigation of security incidents"
    ["IOC"]="Indicator of Compromise: Evidence of breach"
    ["TTPs"]="Tactics, Techniques, Procedures: Attacker behavior patterns"
    ["MITRE ATT&CK"]="Framework mapping adversary tactics and techniques"
)

# Quiz state files
STATS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cybersec-widget"
QUIZ_STATS="$STATS_DIR/quiz-stats.json"
QUIZ_HISTORY="$STATS_DIR/quiz-history.log"

# Create stats directory
mkdir -p "$STATS_DIR"

# Initialize stats if not exists
if [[ ! -f "$QUIZ_STATS" ]]; then
    echo '{"total_questions":0,"correct":0,"incorrect":0,"streak":0,"best_streak":0}' > "$QUIZ_STATS"
fi

# Get random term
terms_keys=($(printf '%s\n' "${!cybersec_terms[@]}" | sort))
total_terms=${#terms_keys[@]}
random_index=$((RANDOM % total_terms))
quiz_term="${terms_keys[$random_index]}"
quiz_answer="${cybersec_terms[$quiz_term]}"

# Show quiz question
hyprctl notify 3 15000 "rgb(f9e2af)" "🎯 Quiz Time! What does '$quiz_term' mean?

Click the widget or press Super+Shift+Q to reveal the answer" >/dev/null 2>&1

# Save current quiz to temp file for answer reveal
echo "$quiz_term|$quiz_answer" > "${XDG_RUNTIME_DIR:-/tmp}/cybersec-quiz-current"

echo "Quiz: $quiz_term"
