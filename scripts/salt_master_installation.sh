#!/bin/bash

#Start by Importing SaltStack repository key:
sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

#add repo
sudo echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list

#update system packet list and install salt
sudo apt -y install salt-api salt-cloud salt-master salt-minion salt-ssh salt-syndic

#firewall reasons
sudo ufw allow proto tcp from any to any port 4505,4506

sudo service salt-master stop
sudo service salt-master start

# END