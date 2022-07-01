#!/bin/bash

# Install packer on Ubuntu systems

if [[ $(lsb_release -is) == "Linuxmint" ]]
then
  LSB_RELEASE=$(awk -F '=' '$1=="DISTRIB_CODENAME" {print $2}' /etc/upstream-release/lsb-release)
else
  LSB_RELEASE=$(lsb_release -cs)
fi

[[ ! -d /etc/apt/keyrings ]] && sudo mkdir /etc/apt/keyrings
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo dd of=/etc/apt/keyrings/hashicorp.gpg 2>/dev/null
echo "Types: deb
URIs: https://apt.releases.hashicorp.com
Suites: ${LSB_RELEASE}
Components: main
Signed-By: /etc/apt/keyrings/hashicorp.gpg" | sudo tee /etc/apt/sources.list.d/apt_releases_hashicorp_com.sources > /dev/null
sudo apt update && sudo apt install packer
echo "Packer version: $(packer --version)"
