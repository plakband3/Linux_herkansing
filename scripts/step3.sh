#!/bin/bash

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