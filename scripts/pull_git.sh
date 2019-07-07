#!/bin/bash

#refresh all -get up to date
sudo apt-get update
sudo apt-get upgrade -y

sudo mkdir /home/joostholwerda/git
sudo mkdir /home/joostholwerda/git/linux-herkansing
cd /home/joostholwerda/git/
sudo git init linux-herkansing
cd /home/joostholwerda/git/linux-herkansing
sudo git remote add origin https://github.com/plakband3/linux-herkansing
sudo git pull origin master

# END