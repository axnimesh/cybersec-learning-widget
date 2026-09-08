#!/usr/bin/env bash
# Category-based learning - Filter by difficulty or category

CATEGORY="$1"

# Categorized terms database
declare -A beginner_terms=(
    ["XSS"]="Cross-Site Scripting: Injecting malicious scripts into trusted websites"
    ["SQLi"]="SQL Injection: Inserting malicious SQL code to manipulate databases"
    ["Phishing"]="Social engineering via fake emails/sites to steal credentials"
    ["DoS"]="Denial of Service: Overwhelming a system to make it unavailable"
    ["Firewall"]="Network security barrier filtering traffic"
    ["VPN"]="Virtual Private Network: Encrypted tunnel"
    ["2FA"]="Two-Factor Authentication: Two-step verification"
    ["Hash"]="One-way cryptographic function output"
    ["Netcat"]="Network utility for reading/writing network connections"
    ["Nmap"]="Network scanner for port and service discovery"
)

declare -A intermediate_terms=(
    ["CSRF"]="Cross-Site Request Forgery: Forcing users to execute unwanted actions"
    ["IDOR"]="Insecure Direct Object Reference: Accessing unauthorized resources"
    ["LFI"]="Local File Inclusion: Reading files on the server"
    ["SSRF"]="Server-Side Request Forgery: Making server request internal resources"
    ["Privesc"]="Privilege Escalation: Gaining higher access level"
    ["Reverse Shell"]="Target connects back to attacker for remote access"
    ["Burp"]="Burp Suite: Web application security testing tool"
    ["Metasploit"]="Penetration testing framework"
    ["JWT"]="JSON Web Token: Compact authentication token"
    ["WAF"]="Web Application Firewall: Filters malicious HTTP traffic"
)

declare -A advanced_terms=(
    ["XXE"]="XML External Entity: Exploiting XML parsers to access files"
    ["SSTI"]="Server-Side Template Injection: Injecting code into templates"
    ["ROP"]="Return-Oriented Programming: Chaining existing code to exploit"
    ["APT"]="Advanced Persistent Threat: Long-term targeted attack"
    ["Pivoting"]="Using compromised system to attack other systems"
    ["MITRE ATT&CK"]="Framework mapping adversary tactics and techniques"
    ["ASLR"]="Address Space Layout Randomization: Memory protection technique"
    ["DEP"]="Data Execution Prevention: Prevents code execution in data regions"
    ["TTPs"]="Tactics, Techniques, Procedures: Attacker behavior patterns"
    ["Rootkit"]="Hides malicious activity and maintains access"
)

# Category selection
case "$CATEGORY" in
    beginner|easy|basic)
        terms_keys=($(printf '%s\n' "${!beginner_terms[@]}" | sort))
        level="Beginner"
        color="rgb(a6e3a1)"
        ;;
    intermediate|medium)
        terms_keys=($(printf '%s\n' "${!intermediate_terms[@]}" | sort))
        level="Intermediate"
        color="rgb(f9e2af)"
        ;;
    advanced|hard|expert)
        terms_keys=($(printf '%s\n' "${!advanced_terms[@]}" | sort))
        level="Advanced"
        color="rgb(f38ba8)"
        ;;
    *)
        hyprctl notify 1 5000 "rgb(f38ba8)" "🛡️ Usage: category-mode.sh [beginner|intermediate|advanced]" >/dev/null 2>&1
        exit 1
        ;;
esac

# Get random term from selected category
total_terms=${#terms_keys[@]}
random_index=$((RANDOM % total_terms))
selected_term="${terms_keys[$random_index]}"

# Get description based on category
case "$CATEGORY" in
    beginner|easy|basic)
        description="${beginner_terms[$selected_term]}"
        ;;
    intermediate|medium)
        description="${intermediate_terms[$selected_term]}"
        ;;
    advanced|hard|expert)
        description="${advanced_terms[$selected_term]}"
        ;;
esac

# Display term with category badge
hyprctl notify 2 8000 "$color" "🛡️ [$level] $selected_term

$description" >/dev/null 2>&1

echo "[$level] $selected_term"
