#!/bin/bash
# Auto VPS Discord Bot Setup (uses existing bot.py, .env, requirements.txt)

# Ensure script runs as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

# Variables
BOT_PATH="/root"  # Folder containing bot.py, .env, requirements.txt
BOT_FILE="bot.py"
SERVICE_FILE="/etc/systemd/system/unixnodes-bot.service"

# 1️⃣ Install dependencies
echo "Installing dependencies..."
apt update
apt install -y python3 python3-pip docker.io

# 2️⃣ Install Python requirements
if [ -f "$BOT_PATH/requirements.txt" ]; then
    echo "Installing Python packages from requirements.txt..."
    pip3 install -r "$BOT_PATH/requirements.txt"
else
    echo "requirements.txt not found in $BOT_PATH. Skipping..."
fi

# 3️⃣ Create systemd service
echo "Creating systemd service..."
cat > "$SERVICE_FILE" <<EOL
[Unit]
Description=UnixNodes VPS Bot
After=network.target docker.service
Requires=docker.service

[Service]
Type=simple
User=root
WorkingDirectory=$BOT_PATH
ExecStart=/usr/bin/python3 $BOT_PATH/$BOT_FILE
Restart=always
RestartSec=30
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Environment="DOCKER_HOST=unix:///var/run/docker.sock"

[Install]
WantedBy=multi-user.target
EOL

# 4️⃣ Create unixnodes user and add to docker group
echo "Creating unixnodes user..."
id -u unixnodes &>/dev/null || useradd -r -s /bin/false unixnodes
usermod -aG docker unixnodes

# 5️⃣ Reload systemd and start service
echo "Starting bot service..."
systemctl daemon-reload
systemctl enable unixnodes-bot.service
systemctl start unixnodes-bot.service

echo "✅ Bot setup complete. Service is running and enabled!"
