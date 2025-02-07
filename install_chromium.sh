#!/bin/bash

# =============================================
#  🚀 CHROMIUM DOCKER INSTALLER BY THE ONE & ONLY... 🚀
# =============================================

echo -e "\e[1;33m══════════════════════════════════════════════\e[0m"
echo -e "\e[1;31m🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\e[0m"
echo -e "\e[1;33m█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█\e[0m"
echo -e "\e[1;32m█  ❤️ Made With Love By SIRTOOLZ ❤️  █\e[0m"
echo -e "\e[1;34m█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█\e[0m"
echo -e "\e[1;31m🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\e[0m"
echo -e "\e[1;33m══════════════════════════════════════════════\e[0m"
echo -e "\e[1;32m🚀 WELCOME TO THE ULTIMATE CHROMIUM INSTALLER!\e[0m"
echo -e "📢 \e[1;34mJoin my Telegram for Exclusive Content: https://t.me/sirtoolzalpha\e[0m"
echo -e "🐦 \e[1;36mFollow me on Twitter: https://twitter.com/sirtoolz\e[0m"
echo -e "\e[1;33m══════════════════════════════════════════════\e[0m"
sleep 5  # Pause for 5 seconds to build anticipation

# Update system packages
echo -e "\e[1;32m🔄 Updating system packages...\e[0m"
sudo apt update -y && sudo apt upgrade -y

# Remove old Docker versions
echo -e "\e[1;31m🛑 Removing old Docker installations...\e[0m"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
    sudo apt-get remove -y $pkg
done

# Install required dependencies
echo -e "\e[1;34m🔧 Installing dependencies...\e[0m"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker’s official GPG key
echo -e "\e[1;33m🔑 Adding Docker GPG key...\e[0m"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo -e "\e[1;35m📦 Adding Docker repository...\e[0m"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
echo -e "\e[1;32m🚀 Installing Docker...\e[0m"
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify Docker installation
docker --version || { echo -e "\e[1;31m❌ Docker installation failed!\e[0m"; exit 1; }

# Prompt user for credentials
echo -e "\e[1;36m🔐 Enter your Chromium container credentials:\e[0m"
read -p "👤 Username: " CUSTOM_USER
read -s -p "🔑 Password: " PASSWORD
echo

# Set up Chromium container
echo -e "\e[1;34m⚙️ Setting up Chromium container...\e[0m"
mkdir -p ~/chromium
cd ~/chromium || exit

# Create docker-compose.yaml
echo -e "\e[1;35m📄 Generating docker-compose.yaml...\e[0m"
cat <<EOF > docker-compose.yaml
---
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined
    environment:
      - CUSTOM_USER=$CUSTOM_USER
      - PASSWORD=$PASSWORD
      - PUID=1000
      - PGID=1000
      - TZ=$(timedatectl show --property=Timezone --value)
      - CHROME_CLI=https://github.com/0xmoei
    volumes:
      - /root/chromium/config:/config
    ports:
      - 3010:3000
      - 3011:3001
    shm_size: "1gb"
    restart: unless-stopped
EOF

# Start the Chromium container
echo -e "\e[1;33m🚀 Starting Chromium container...\e[0m"
docker compose up -d

echo -e "\e[1;32m✅ Setup complete! Access Chromium via port 3010\e[0m"
echo -e "\e[1;32m✅ To Access Your Chromium visit http://Replace-With-VPS-IP-Address:3010 with a normal browser\e[0m"
echo -e "\e[1;32m✅ Your address will look similar to this http://101.251.217.197:3010\e[0m"
echo -e "\e[1;32m✅ Login with your username and password\e[0m"
echo -e "🔥 \e[1;35mJoin my Telegram for more tools: https://t.me/sirtoolzalpha\e[0m"
echo -e "🐦 \e[1;36mFollow me on Twitter: https://twitter.com/sirtoolz\e[0m"
