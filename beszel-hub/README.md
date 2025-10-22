# Beszel Hub Add-on

Lightweight server monitoring hub with Docker stats and historical data.

## About

Beszel is a lightweight server resource monitoring hub with historical data, docker stats, and alert functions.

**Features:**

- Real-time server monitoring
- Docker container statistics
- Historical data tracking
- Alert configuration
- Multi-system monitoring
- Lightweight and fast
- Beautiful web interface

## Installation

1. Add this repository to your Home Assistant instance:
   
   - Navigate to **Settings** → **Add-ons** → **Add-on Store**
   - Click the **⋮** menu in the top right
   - Select **Repositories**
   - Add: `https://github.com/anand34577/homeassistant-beszel-hub`

2. Install the **Beszel Hub** add-on

3. Click **"Start"** to run the add-on

4. Click **"OPEN WEB UI"** to access Beszel Hub

## First Time Setup

1. Open the Web UI
2. Create your admin account
3. Configure your monitoring preferences
4. Add systems to monitor

## Adding Monitored Systems

To monitor systems, install Beszel agents on each server you want to track.

### Monitor Other Servers

For Docker-based systems, use this docker-compose.yml:



Get the public key and setup instructions from the Beszel Hub web interface.

### Monitor Home Assistant System

Install the **Beszel Agent** add-on from the Community Add-ons repository to monitor your Home Assistant system itself.

## Support

- [Beszel Documentation](https://beszel.dev)
- [Beszel GitHub](https://github.com/henrygd/beszel)
- [Add-on Repository Issues](https://github.com/yourusername/homeassistant-beszel-hub/issues)
