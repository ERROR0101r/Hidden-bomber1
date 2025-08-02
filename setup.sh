#!/bin/bash

# Ultimate SMS Bomber Setup Script
# Author: HiDDEN KING
# Version: 2.0
# Features: Cool interface, animations, and interactive menu

# Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Animation function
animate() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.03
    done
    echo
}

# Progress bar function
progress_bar() {
    local duration=${1}
    local columns=$(tput cols)
    local space=$(( columns - 20 ))
    printf "${PURPLE}"
    for ((i=0; i<=duration; i++)); do
        percentage=$(( i * 100 / duration ))
        completed=$(( i * space / duration ))
        remaining=$(( space - completed ))
        printf "\r["
        printf "%${completed}s" | tr ' ' '='
        printf "%${remaining}s" | tr ' ' ' '
        printf "] ${percentage}%%"
        sleep 0.1
    done
    printf "${NC}\n"
}

# Clear screen
clear

# Cool banner with colors
echo -e "${RED}"
cat << "EOF"
 ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄ 
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌
▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌
▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌
▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌
▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀ ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌
▐░▌          ▐░▌     ▐░▌  ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌
▐░▌          ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌
▐░▌          ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌
 ▀            ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀ 
EOF
echo -e "${NC}"

animate "${BLUE}🔥 Ultimate SMS Bomber Pro ${NC}${YELLOW}|${NC} ${RED}Developer: HiDDEN KING${NC}"
echo -e "${RED}⚠️ WARNING: For educational purposes only! ⚠️${NC}"
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    animate "${RED}[!] Warning: It's not recommended to run this as root!${NC}"
    sleep 2
fi

# Main menu
while true; do
    echo -e "${CYAN}"
    echo "┌──────────────────────────────────────────────┐"
    echo "│                ${WHITE}MAIN MENU${CYAN}                     │"
    echo "├──────────────────────────────────────────────┤"
    echo "│  1. Install & Setup SMS Bomber               │"
    echo "│  2. Run SMS Bomber                           │"
    echo "│  3. Update SMS Bomber                        │"
    echo "│  4. View Documentation                       │"
    echo "│  5. Exit                                     │"
    echo "└──────────────────────────────────────────────┘"
    echo -e "${NC}"
    
    read -p "$(echo -e "${YELLOW}Select an option [1-5]: ${NC}")" choice
    
    case $choice in
        1)
            echo -e "${GREEN}"
            animate "[*] Starting installation process..."
            echo -e "${NC}"
            
            # Check dependencies
            echo -e "${CYAN}[*] Checking dependencies...${NC}"
            
            # Check for Python 3
            if ! command -v python3 &> /dev/null; then
                animate "${RED}[!] Python3 is not installed!${NC}"
                animate "${YELLOW}[*] Installing Python3...${NC}"
                progress_bar 10
                sudo apt-get update && sudo apt-get install -y python3
            else
                animate "${GREEN}[✓] Python3 is already installed.${NC}"
            fi
            
            # Check for pip
            if ! command -v pip3 &> /dev/null; then
                animate "${RED}[!] pip3 is not installed!${NC}"
                animate "${YELLOW}[*] Installing pip3...${NC}"
                progress_bar 10
                sudo apt-get install -y python3-pip
            else
                animate "${GREEN}[✓] pip3 is already installed.${NC}"
            fi
            
            # Install required packages
            echo -e "${CYAN}[*] Installing required packages...${NC}"
            progress_bar 15
            pip3 install requests
            
            # Download the bomber script
            echo -e "${CYAN}[*] Downloading hiddenbomber.py...${NC}"
            if [ -f "hiddenbomber.py" ]; then
                animate "${YELLOW}[*] hiddenbomber.py already exists. Overwriting...${NC}"
            fi
            
            # Download the file with progress animation
            animate "${BLUE}[*] Downloading from server...${NC}"
            progress_bar 20
            curl -s -o hiddenbomber.py https://raw.githubusercontent.com/hidden-king/sms-bomber/main/hiddenbomber.py || wget -q -O hiddenbomber.py https://raw.githubusercontent.com/hidden-king/sms-bomber/main/hiddenbomber.py
            
            if [ ! -f "hiddenbomber.py" ]; then
                animate "${RED}[!] Failed to download hiddenbomber.py!${NC}"
            else
                # Make it executable
                chmod +x hiddenbomber.py
                
                echo -e "${GREEN}"
                animate "[+] Setup completed successfully!"
                animate "[*] To run the bomber: python3 hiddenbomber.py"
                echo -e "${NC}"
                echo -e "${RED}⚠️ REMEMBER: Use this tool responsibly and only on numbers you own! ⚠️${NC}"
            fi
            ;;
        2)
            if [ -f "hiddenbomber.py" ]; then
                animate "${GREEN}[*] Starting SMS Bomber...${NC}"
                python3 hiddenbomber.py
            else
                animate "${RED}[!] SMS Bomber not found! Please install it first.${NC}"
            fi
            ;;
        3)
            animate "${YELLOW}[*] Updating SMS Bomber...${NC}"
            progress_bar 15
            rm -f hiddenbomber.py
            curl -s -o hiddenbomber.py https://raw.githubusercontent.com/hidden-king/sms-bomber/main/hiddenbomber.py || wget -q -O hiddenbomber.py https://raw.githubusercontent.com/hidden-king/sms-bomber/main/hiddenbomber.py
            
            if [ -f "hiddenbomber.py" ]; then
                chmod +x hiddenbomber.py
                animate "${GREEN}[✓] Update successful!${NC}"
            else
                animate "${RED}[!] Update failed!${NC}"
            fi
            ;;
        4)
            echo -e "${CYAN}"
            echo "┌──────────────────────────────────────────────┐"
            echo "│               ${WHITE}DOCUMENTATION${CYAN}                   │"
            echo "├──────────────────────────────────────────────┤"
            echo "│ ${YELLOW}Usage:${NC} python3 hiddenbomber.py                 │"
            echo "│                                              │"
            echo "│ ${YELLOW}Features:${NC}                                     │"
            echo "│ - Multi-threaded SMS bombing                │"
            echo "│ - Supports multiple APIs                    │"
            echo "│ - Country code selection                     │"
            echo "│ - Real-time statistics                      │"
            echo "│                                              │"
            echo "│ ${YELLOW}Legal Notice:${NC}                                  │"
            echo "│ This tool is for educational purposes only.  │"
            echo "│ Using it for malicious purposes is illegal.  │"
            echo "└──────────────────────────────────────────────┘"
            echo -e "${NC}"
            ;;
        5)
            animate "${BLUE}[*] Exiting... Thank you for using Ultimate SMS Bomber!${NC}"
            exit 0
            ;;
        *)
            animate "${RED}[!] Invalid option! Please select 1-5.${NC}"
            ;;
    esac
    
    read -p "$(echo -e "${YELLOW}Press Enter to continue...${NC}")" dummy
    clear
done