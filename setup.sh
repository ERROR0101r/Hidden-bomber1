#!/bin/bash

# Simple SMS Bomber Installer
# Author: HiDDEN KING

# Colors for minimal output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[*] Starting SMS Bomber installation${NC}"

# Check and install Python3 if needed
if ! command -v python3 &> /dev/null; then
    echo -e "[*] Installing Python3..."
    sudo apt-get install -y python3 > /dev/null 2>&1 || { echo -e "${RED}[!] Failed to install Python3${NC}"; exit 1; }
fi

# Check and install pip if needed
if ! command -v pip3 &> /dev/null; then
    echo -e "[*] Installing pip..."
    sudo apt-get install -y python3-pip > /dev/null 2>&1 || { echo -e "${RED}[!] Failed to install pip${NC}"; exit 1; }
fi

# Install required Python package
echo -e "[*] Installing required packages..."
pip3 install requests > /dev/null 2>&1 || { echo -e "${RED}[!] Failed to install requests module${NC}"; exit 1; }


# Make executable
chmod +x hiddenbomber.py

echo -e "${GREEN}[✓] Installation completed successfully!${NC}"

# Ask to run immediately
read -p "Do you want to run the SMS Bomber now? [y/N]: " choice
if [[ $choice =~ ^[Yy]$ ]]; then
    python3 hiddenbomber.py
else
    echo -e "You can run it later with: ${GREEN}python3 hiddenbomber.py${NC}"
fi