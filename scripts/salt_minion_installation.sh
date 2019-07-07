#!/bin/bash

# IP SALT MASTER IS REQUIRED

echo "Voer aub ip address van salt-master in: "
read ip_address

sudo apt-get update
sudo apt-get upgrade


sudo curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -A $ip_address
sudo systemctl restart salt-minion

