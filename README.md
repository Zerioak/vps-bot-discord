# 🚀 VPS Creating Bot  

A powerful Discord bot that helps you **create and manage VPS instances** directly from your Discord server.  
Built with **Node.js + discord.js v14**, designed for automation and efficiency.  

---

## ✨ Features  
- 🔹 Deploy VPS servers with simple commands  
- 🔹 Manage instances (start/stop/reboot)  
- 🔹 Get real-time server status reports  
- 🔹 Easy to set up & run on any VPS  
- 🔹 **All in One — Single Command** ⚡  

---

## 📦 Installation  

1. Clone the repo:  
   ```bash
   git clone https://github.com/Zerioak/vps-bot-discord.git
   cd vps-bot-discord

2. Install dependencies:
```
sudo apt install python3-pip
```
```
pip install -r requirements.txt
```

3. Chante The .env file to Your bot token :

DISCORD_TOKEN=your_discord_bot_token_here
ADMIN_IDS=1210291131301101618
ADMIN_ROLE_ID=1376177459870961694
DEFAULT_OS_IMAGE=ubuntu:22.04
DOCKER_NETWORK=bridge
MAX_CONTAINERS=100
MAX_VPS_PER_USER=3


5. Deploy slash & start the bot commands:
```
python3 bot.py
```

---

🖥️ VPS Providers Supported

Ubuntu

Debian

Custom (your own API integration)



---

📜 Example Commands
```
/create-vps <provider> <region> → Creates a new VPS

/list-vps → Shows your active servers

/status <id> → Get VPS status

/delete-vps <id> → Destroy a VPS
```


---

👑 Credits

1 in All Code Developed by Ali —
Code by HopingBoyz —


---

🛡️ License

MIT License © 2025 — Free to use, modify, and deploy.
