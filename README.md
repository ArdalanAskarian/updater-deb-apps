# updater-deb-apps

A no-nonsense, slightly sarcastic bash script that updates your Ubuntu system packages and keeps Zoom, Discord, and Slack fresh—so you don’t have to chase .deb files like it's 2004. Run it, relax, and pretend you're DevOps for your own laptop.

# update_apps.sh

This script automates the update process for:

- Ubuntu system packages (`apt update && upgrade`)
- Zoom (latest `.deb`)
- Discord (latest `.deb`)
- Slack (latest `.deb`)

## Usage

1. Save the script as `update_apps.sh`
2. Make it executable:

   ```bash
   chmod +x update_apps.sh

