#!/bin/bash
#rsyslog configuratie MASTER

#refresh all
sudo apt-get update
sudo apt-get upgrade

#installatie rsyslog
sudo apt-get install rsyslog -y

#extra folder aanmaken voor backup config file
sudo mkdir /etc/backup_rsyslog

#verplaatsen naar nieuw aangemaakte folder
sudo mv /etc/rsyslog.conf /etc/backup_rsyslog/rsyslog.conf

#configuratie die klaar staat op git voor rsyslog kopieren naar /etc/rsyslog
sudo cp /home/joostholwerda/git/linux-herkansing/rsyslog_master_config/rsyslog.conf /etc/rsyslog.conf

#stop start om restart te voorkomen
sudo systemctl stop rsyslog
sudo systemctl start rsyslog

#status voor gebruiker
sudo systemctl status rsyslog


echo "location stored logs: /var/log/saved_logs.log " 