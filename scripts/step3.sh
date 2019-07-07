#!/bin/bash

# Install and configure Git

# Login minion and use pull_git.sh to pull git on ubuntu master
sudo nano /home/joostholwerda/pull_git.sh

# manually copy script and paste in master pull_git.sh
# save, confirm
sudo chmod +x /home/joostholwerda/pull_git.sh
sudo /home/joostholwerda/pull_git.sh


# Install and configure Salt
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/salt_minion_installation.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/salt_minion_installation.sh


# Install and configure Rsyslog
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/rsyslog_minion.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/rsyslog_minion.sh


# install and configure Munin (monitoring)
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/munin_minion.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/munin_minion.sh

# END