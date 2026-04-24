#!/bin/bash

# ============================================
# Node.js 20 Setup Script (Minimal)
# ============================================

set -e

# Colors
GREEN='\033[0;32m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}[1/2] Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${MAGENTA}[2/2] Installing Node.js 20...${NC}"
# Cek jika node sudah ada atau versi di bawah 20
if ! command -v node &> /dev/null || [[ $(node -v | cut -d. -f1 | tr -d 'v') -ne 20 ]]; then
    echo "Installing Node.js 20 from NodeSource..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
fi

echo -e "${MAGENTA}Installing PM2...${NC}"
sudo npm install -g pm2

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  Node.js Setup Complete!${NC}"
echo -e "${GREEN}=========================================${NC}"
echo -e "  • Node.js $(node -v)"
echo -e "  • npm v$(npm -v)"
echo -e "  • PM2 $(pm2 -v)"
echo ""
