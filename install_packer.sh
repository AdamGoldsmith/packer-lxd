#!/bin/bash

# Install packer on Ubuntu system

[[ ! -d /etc/apt/keyrings ]] && sudo mkdir /etc/apt/keyrings
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo dd of=/etc/apt/keyrings/hashicorp.gpg 2>/dev/null
echo "Types: deb
URIs: https://apt.releases.hashicorp.com
Suites: $(lsb_release -cs)
Components: main
Signed-By: /etc/apt/keyrings/hashicorp.gpg" | sudo tee /etc/apt/sources.list.d/apt_releases_hashicorp_com.sources > /dev/null
sudo apt update && sudo apt install packer
echo "Packer version: $(packer --version)"
