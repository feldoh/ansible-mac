#!/bin/bash
set -e

#Setup mac dev-tools
timestamp=$(date +%s)
xcode_dl="/tmp/download-xcode-${timestamp}.sh"
curl -o "$xcode_dl" "https://raw.githubusercontent.com/timsutton/osx-vm-templates/master/scripts/xcode-cli-tools.sh"
chmod +x "$xcode_dl"
export INSTALL_XCODE_CLI_TOOLS="true"
"$xcode_dl"
rm "$xcode_dl"
export INSTALL_XCODE_CLI_TOOLS=

#Install ansible
sudo -H easy_install pip
sudo -H pip install ansible

#Make ssh key if needed
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  echo "Please enter your email for default SSH keygen"
  read ssh_email
  ssh-keygen -t rsa -b 4096 -C "$ssh_email"
fi

echo "Happy Mooing"

