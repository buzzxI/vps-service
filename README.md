# VPS Service - Flexible Docker Setup

A flexible Docker Compose setup for running nginx, xray, and hysteria2 with automatic SSL certificate management using ACME/Let's Encrypt.

## Features

- **SNI-based traffic routing** using nginx stream module
- **Automatic SSL certificate generation** with ACME.sh
- **Flexible domain configuration** using environment variables
- **Multiple proxy protocols**: VLESS, WebSocket, Reality, Hysteria2
- **Automatic certificate renewal**
- **Easy management scripts**