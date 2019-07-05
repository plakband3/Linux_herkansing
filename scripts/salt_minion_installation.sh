#!/bin/bash

# IP SALT MASTER IS REQUIRED

sudo apt-get update
sudo apt-get upgrade


sudo curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -A 137.117.222.202
sudo systemctl restart salt-minion