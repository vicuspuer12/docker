#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "--- Updating and Upgrading System ---"
apt update && apt upgrade -y

echo "--- Installing CrowdSec ---"
curl -s https://install.crowdsec.net | sh
apt install crowdsec -y

echo "--- Enrolling CrowdSec Console ---"
cscli console enroll "--- CrowdSec Console Enroll Token ---"

echo "--- Installing Docker ---"
curl -fsSL https://get.docker.com/ | bash

echo "--- Installing Dependencies (jq, curl) ---"
apt install jq curl -y

echo "--- Setting up NetBird with Zitadel ---"
export NETBIRD_DOMAIN="--- The Domain name for the NetBird VPN server (Remember to add the Public IP of the server as A record on the DNS records) ---"
curl -fsSL https://github.com/netbirdio/netbird/releases/latest/download/getting-started-with-zitadel.sh | bash

echo "--- Setup Complete ---"
