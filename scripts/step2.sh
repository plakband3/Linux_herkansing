#!/bin/bash

# install Salt for master
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/salt_master_installation.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/salt_master_installation.sh


# install Munin for master
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/munin_master.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/munin_master.sh


# install Rsyslog for master
sudo chmod +x /home/joostholwerda/git/linux-herkansing/scripts/rsyslog_master.sh
sudo /home/joostholwerda/git/linux-herkansing/scripts/rsyslog_master.sh


# END