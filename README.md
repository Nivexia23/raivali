<p align="center">
  <a href="https://github.com/Raivali/panel" target="_blank" rel="noopener noreferrer">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://github.com/Raivali/Raivali.github.io/raw/main/public/logos/Raivali-white-logo.png">
      <img width="160" height="160" src="https://github.com/Raivali/Raivali.github.io/raw/main/public/logos/Raivali-black-logo.png">
    </picture>
  </a>
</p>

<h1 align="center">🛡️ Raivali</h1>

<p align="center">
    <strong>Unified & Censorship-Resistant Proxy Management Solution</strong>
</p>

---

<br/>
<p align="center">
    <a href="https://github.com/Raivali/panel/actions/workflows/build.yml" target="_blank">
        <img src="https://img.shields.io/github/actions/workflow/status/Raivali/panel/build.yml?style=flat-square" />
    </a>
    <a href="https://hub.docker.com/r/Raivali/panel" target="_blank">
        <img src="https://img.shields.io/docker/pulls/raivali/panel?style=flat-square&logo=docker" />
    </a>
    <a href="https://github.com/Raivali/panel/blob/main/LICENSE" target="_blank">
        <img src="https://img.shields.io/github/license/Raivali/panel?style=flat-square" />
    </a>
    <a href="https://t.me/Pasar_Guard" target="_blank">
        <img src="https://img.shields.io/badge/telegram-group-blue?style=flat-square&logo=telegram" />
    </a>
    <a href="https://github.com/Raivali/panel" target="_blank">
        <img src="https://img.shields.io/github/stars/Raivali/panel?style=social" />
    </a>
</p>

<p align="center">
 <a href="./README-fa.md">
 🇮🇷 فارسی
 </a>
  /
  <a href="./README-zh-cn.md">
 🇨🇳 简体中文
 </a>
   /
  <a href="./README-ru.md">
 🇷🇺 Русский
 </a>
</p>

<p align="center">
  <a href="https://github.com/Raivali/panel" target="_blank" rel="noopener noreferrer" >
    <img src="https://github.com/Raivali/Raivali.github.io/raw/main/public/logos/screenshot.png" alt="Raivali screenshots" width="600" height="auto">
  </a>
</p>

## 📋 Table of Contents

> **Quick Navigation** - Jump to any section below

-   [📖 Overview](#-overview)
    -   [🤔 Why using Raivali?](#-why-using-raivali)
        -   [✨ Features](#-features)
-   [🚀 Installation guide](#-installation-guide)
-   [📚 Documentation](#-documentation)
-   [💖 Donation](#-donation)

---

# 📖 Overview

> **What is Raivali?**

Raivali is a powerful proxy management tool that offers an intuitive and efficient interface for handling hundreds of proxy accounts. Built with Python and React.js it combines performance, scalability, and ease of use to simplify large-scale proxy management. It supports both [Xray-core](https://github.com/XTLS/Xray-core) and [WireGuard](https://www.wireguard.com/) for maximum performance.

---

## 🤔 Why using Raivali?

> **Simple, Powerful, Reliable**

Raivali is a user-friendly, feature-rich, and reliable proxy management tool. It allows you to create and manage multiple proxies for your users without the need for complex configuration. With its built-in web interface, you can easily monitor activity, modify settings, and control user access limits — all from one convenient dashboard.

---

### ✨ Features

<div align="left">

**🌐 Web Interface & API**
- Built-in **Web UI** dashboard
- Fully **REST API** backend
- **Multi-Node** support for infrastructure distribution

**🔐 Protocols & Security**
- Supports **Vmess**, **VLESS**, **Trojan**, **Shadowsocks**, **WireGuard** and **Hysteria2**
- **TLS** and **REALITY** support
- **Multi-protocol** for a single user

**👥 User Management**
- **Multi-user** on a single inbound
- **Multi-inbound** on a **single port** (fallbacks support)
- **Traffic** and **expiry date** limitations
- **Periodic** traffic limit (daily, weekly, etc.)
- **HWID/device limits** for hardware-bound access control

**🔗 Subscriptions & Sharing**
- **Subscription link** compatible with **V2ray**, **Clash** and **ClashMeta**
- Automated **Share link** and **QRcode** generator
- System monitoring and **traffic statistics**

**🛠️ Tools & Customization**
- Customizable xray configuration
- Integrated **Telegram Bot**
- **Command Line Interface (CLI)**
- **Multi-language** support
- **Multi-admin** support with **RBAC** for granular permissions and scoped access

</div>

---

# 🚀 Installation guide

> **Quick Start** - Get Raivali running in minutes

### For a quick setup, use the following commands based on your preferred database.

---

**TimescaleDB (Recommended):**
```bash
sudo bash -c "$(curl -fsSL https://github.com/Raivali/scripts/raw/main/raivali.sh)" @ install --database timescaledb
```

**SQLite:**
```bash
sudo bash -c "$(curl -fsSL https://github.com/Raivali/scripts/raw/main/raivali.sh)" @ install
```

**MySQL:**
```bash
sudo bash -c "$(curl -fsSL https://github.com/Raivali/scripts/raw/main/raivali.sh)" @ install --database mysql
```

**MariaDB:**
```bash
sudo bash -c "$(curl -fsSL https://github.com/Raivali/scripts/raw/main/raivali.sh)" @ install --database mariadb
```

**PostgreSQL:**
```bash
sudo bash -c "$(curl -fsSL https://github.com/Raivali/scripts/raw/main/raivali.sh)" @ install --database postgresql
```

### 📋 After installation:

<div align="left">

**📋 Watch the logs** (press `Ctrl+C` to stop)

**📁 Files are located at** `/opt/raivali`

**⚙️ Config file:** `/opt/raivali/.env` (see [Configuration](#-configuration) for details)

**💾 Data files:** `/var/lib/raivali`

**🔒 Important:** Dashboard requires SSL certificate for security
- Get SSL certificate: [Guide](https://docs.raivali.org/en/examples/issue-ssl-certificate)
- Access: `https://YOUR_DOMAIN:8000/dashboard/`

**🔗 For testing without domain:** Use SSH port forwarding (see below)

</div>

---

```bash
ssh -L 8000:localhost:8000 user@serverip
```

Then access: `http://localhost:8000/dashboard/`

> ⚠️ **Testing only** - You'll lose access when you close the SSH terminal.

### 🔧 Next Steps:

```bash
# Generate a one-time setup key for owner account setup
raivali cli generate-temp-key

# Use the key on the dashboard login page to create the owner account

# Get help
raivali --help
```



# 📚 Documentation

<div align="left">

**📖 Official Documentation** - Complete guides available in:

🇺🇸 **[English](https://docs.raivali.org/en)**

🇮🇷 **[فارسی](https://docs.raivali.org/fa)**

🇷🇺 **[Русский](https://docs.raivali.org/ru)**

🇨🇳 **[简体中文](https://docs.raivali.org/zh-cn)**

</div>

> **Contributing:** Help improve documentation on [GitHub](https://github.com/Raivali/Raivali.github.io)

---

# 💖 Donation

<div align="left">

> **Support Raivali Development**

If Raivali helps you, consider supporting its development:

[![Donate](https://img.shields.io/badge/Donate-Support%20Us-green?style=for-the-badge)](https://donate.raivali.org)

**Thank you for your support!** 💖

</div>

---

<p align="center">
  Made with ❤️ for Internet freedom
</p>

